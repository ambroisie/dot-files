# Allow inclusion of home directories in ~/.Xresources
xrdb -I$HOME ~/.Xresources

# Autolock after 1 minute without any input, lock on upper-left, don't in lower-right
xautolock -time 1 -cornerredelay 5 -corners +00- -locker "~/scripts/i3exit lock" &

# Launch i3
exec i3
