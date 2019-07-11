# Allow inclusion of home directories in ~/.Xresources
xrdb -I$HOME ~/.Xresources

# Autolock after 1 minute without any input, unless the mouse is in the corner
xautolock -time 1 -corners 000+ -locker "~/scripts/i3exit lock"

# Launch i3
exec i3
