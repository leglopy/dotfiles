if [ "$(yabai -m query --windows --space $2 | grep -cim1 "\"app\":\"$1\"")" -ge 1 ]; then
    echo found $1
else
    echo not found, open $1
    open -n -a "$1" 
fi
