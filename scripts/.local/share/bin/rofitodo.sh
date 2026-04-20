scrDir="$(dirname "$(realpath "$0")")"
source "${scrDir}/globalcontrol.sh"
roconf="${confDir}/rofi/todos.rasi"
rofi -modi "My Day:todolist myday,Todos:todolist general,Checkout:todolist movie" -show 'My Day' -config $roconf 
