find -d "$PWD" -type d | while read; do cd "$REPLY"; nospace.sh; done