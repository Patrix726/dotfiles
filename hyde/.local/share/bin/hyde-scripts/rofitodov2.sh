set -o pipefail

scrDir="$(dirname "$(realpath "$0")")"
source "${scrDir}/globalcontrol.sh"
ROCONF="${confDir}/rofi/todos.rasi"

GROUP_NAMES=("My Day" "Todos" "Checkout")
GROUP_CMDS=("todolist myday" "todolist general" "todolist movie")

# Initialize groups from ~/.todos (only *.todo, sorted by creation date)
init_groups() {
    local todo_dir="$HOME/.todos"
    GROUP_NAMES=()
    GROUP_CMDS=()

    # find all .todo files, sort by creation time (oldest first)
    while IFS= read -r file; do
        local base
        base="$(basename "$file" .todo)"      # strip extension
        GROUP_NAMES+=("$base")
        GROUP_CMDS+=("todolist ${base,,}")    # lowercase for command arg
    done < <(
        find "$todo_dir" -maxdepth 1 -type f -name '*.todo' -printf '%T@ %p\n' \
        | sort -n | awk '{print $2}'
    )
}
# Show a menu and return the selected item (with key handling)
show_menu() {
    local prompt="$1"
    shift
    local options=("$@")
    local choice
    local exit_code

    # rofi keymaps:
    # Ctrl+BackSpace = 10 → go back to group
    # Ctrl+n = 11 → notify the selected task
    choice=$(printf "%s\n" "${options[@]}" | rofi -dmenu -p "$prompt" \
          -kb-custom-1 "Control-Delete" \
          -kb-custom-2 "Control-n" \
          -config $ROCONF )

    exit_code=$?

    case $exit_code in
        10) echo "__DELETE__:$choice" ;;   # Ctrl+Shift+BackSpace
        11) echo "__NOTIFY__:$choice" ;; # Ctrl+n
        *) echo "$choice" ;;
    esac
}

get_group_cmd() {
    local name="$1"
    for i in "${!GROUP_NAMES[@]}"; do
        if [ "${GROUP_NAMES[$i]}" = "$name" ]; then
            echo "${GROUP_CMDS[$i]}"
            return
        fi
    done
}

delete_group() {
    local name="$1"
    local todo_file="$HOME/.todos/$name.todo"

    # Remove from arrays
    for i in "${!GROUP_NAMES[@]}"; do
        if [ "${GROUP_NAMES[$i]}" = "$name" ]; then
            unset 'GROUP_NAMES[i]'
            unset 'GROUP_CMDS[i]'
            break
        fi
    done

    # Compact arrays (remove gaps from unset)
    GROUP_NAMES=("${GROUP_NAMES[@]}")
    GROUP_CMDS=("${GROUP_CMDS[@]}")

    # Delete the file if it exists
    if [ -f "$todo_file" ]; then
        rm -f "$todo_file"
        notify-send "Deleted group: $name"
    else
        notify-send "Removed temporary group: $name"
    fi
}

main() {
    init_groups

    while true; do
        group=$(show_menu "Select group:" "${GROUP_NAMES[@]}")

        [ -z "$group" ] && exit 0

        if [[ "$group" = __DELETE__:* ]]; then 
            selected_group="${group#__DELETE__:}"
            delete_group "$selected_group"
            continue
        fi

         # Handle custom group (dot prefix)
        if [[ "$group" == .* ]]; then
            local new_group="${group#.}"               # strip leading dot
            local new_cmd="todolist ${new_group,,}"    # lowercase command arg

            # Append to arrays
            GROUP_NAMES+=("$new_group")
            GROUP_CMDS+=("$new_cmd")

            group="$new_group"
        fi

        while true; do
            cmd=$(get_group_cmd "$group")

            # read items safely
            mapfile -t items < <($cmd)

            choice=$(show_menu "$group:" "${items[@]}")

            if [ -z "$choice" ]; then
                break
            elif [ "$choice" = __DELETE__:* ]; then
                break
            elif [[ "$choice" == __NOTIFY__:* ]]; then
                # Send notification with the selected task
                task="${choice#__NOTIFY__:}"
                notify-send "$task"
            else
                $cmd "$choice"
            fi
        done
    done
}

main

