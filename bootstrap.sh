#!/usr/bin/env bash

# Exit on errors
set -e

for arg; do
    case "$arg" in
        --no-creds)
            NOCREDS=1
            ;;
        --no-lang)
            NOLANG=1
            ;;
        --no-yay)
            NOYAY=1
            ;;
        *)
            echo "Unknown option '$arg'" >&2
            echo "Usage: $0 [--no-creds] [--no-lang] [--no-yay]" >&2
            exit 1
            ;;
    esac
done

# Install pre-requisite packages for installing packages and connecting
prerequisite() {
    sudo pacman -Syu --noconfirm --needed base base-devel git stow mosh jq
}

# Install the yay AUR helper
install-yay() {
    git clone https://aur.archlinux.org/yay.git
    pushd yay || exit 1
    makepkg -si
    popd || exit 1
}

# Keyboard and language setup
setup-lang() {
    # A good QWERTY keyboard with easy access to accents
    sudo localectl set-x11-keymap fr pc105 us
    # FIXME: no international keyboard in VC for now
    sudo localectl set-keymap --no-convert us
}

get-doc() {
    # $1: name of folder which contains the wanted document
    # $2: name of the document
    # $3: destination
    # $4: permissions

    local FOLDER_ID
    local NOTES
    FOLDER_ID="$(bw list folders |
        jq '.[] | select(.name == "'"$1"'") | .id' |
        cut -d'"' -f2)"

    NOTES="$(bw list items --folderid "$FOLDER_ID" |
        jq '.[] | select(.name == "'"$2"'") | .notes' |
        cut -d'"' -f2)"

    printf "%b" "$NOTES" > "$3"
    chmod "$4" "$3"
}

get-ssh() {
    mkdir -p "$HOME/.ssh"
    chmod 700 "$HOME/.ssh"

    get-doc "SysAdmin/SSH" "shared-key-public" "$HOME/.ssh/shared_rsa.pub" 644
    get-doc "SysAdmin/SSH" "shared-key-private" "$HOME/.ssh/shared_rsa" 600
}

get-pgp() {
    local KEY
    KEY=key.asc
    get-doc "SysAdmin/PGP" "pgp-key-private" "$KEY" 644

    gpg —-import "$KEY"
    printf '5\ny\n' | gpg --command-fd 0  --edit-key 'Bruno BELANYI'  trust
}

get-creds() {
    if [ -z "${BW_SESSION-set}" ]; then
        BW_SESSION="$(bw login --raw)"
        export BW_SESSION
    fi

    get-ssh
    get-pgp
}

prerequisite
[ -z "$NOYAY" ] && install-yay
[ -z "$NOLANG" ] && setup-lang
[ -z "$NOCREDS" ] && get-creds
exit 0
