# Personal Functions
function cursor() {
    args=("$@")
    (nohup ~/Applications/Cursor.AppImage "${args[@]}" --no-sandbox </dev/null >/dev/null 2>&1 &)
}

function yz() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

function batf() {
  local filename="$1"
  if [[ ! -f "$filename" ]]; then
    echo "Error: File '$filename' does not exist."
    return 1
  fi
  local extension="${filename##*.}"
  tail -f "$filename" | bat -l "$extension" --paging=never
}

function spotsync() {
  local query="$1"
  if [[ -z $query ]]; then
    spotdl sync .spotdl
    return 1
  fi
  spotdl sync "$query" --save-file .spotdl
}
