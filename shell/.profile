# Export variables during login only, for Bash and Zsh
if { [ -n "$BASH_VERSION" ] && shopt -q login_shell; } ||
    { [ -n "$ZSH_VERSION" ] && [[ -o login ]]; } ||
    # FIXME: I don't know why lightdm doesn't run sh as a login shell
    [ "$0" = /etc/lightdm/Xsession ]; then
    # Add our scripts to the path
    export PATH="$HOME/.scripts:$PATH"

    # Rust installation
    export PATH="$HOME/.cargo/bin:$PATH"

    # User-local bin directories
    export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

    # Color ls output depending on filetype with dircolors
    [ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
    [ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
    [ -e "$DIR_COLORS" ] || DIR_COLORS=""
    eval "$(dircolors -b $DIR_COLORS)"

    # Use lesspipe as a file preprocessor (unlike  bat, can somewhat read pdf)
    { [ -x /usr/bin/lesspipe.sh ] && eval "$(lesspipe.sh)"; } ||
        { [ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"; } # Quoting seems necessary

    # Export our favorite editor
    export EDITOR=vim
    export VISUAL=$EDITOR # Also use it when asking for a GUI
    # Export our terminal for i3-sensible-terminal
    export TERMINAL=termite

    # Use my own ranger config file with all mappings defined
    export RANGER_LOAD_DEFAULT_RC=FALSE

    # Use less as my default pager
    export PAGER=less
    # Allow for colorful man pages, clear the screen on start and exit
    export LESS='-R -+X -c'
    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

    # Use my preferred pager settings for bat
    export BAT_PAGER="$PAGER $LESS"
fi

# Use keychain to handle ssh-agent, in interactive shell too
eval "$(keychain --eval id_rsa --eval shared_rsa --quiet)"

# Use my localrc script to automatically source/unsource local configurations
source ~/.scripts/localrc

if [ -e ~/.local_profile ]; then
    source ~/.local_profile
fi
