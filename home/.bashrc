#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Functions
enable() {
    sv="/etc/sv/$1"
    if [ -e "$sv" ]; then
        sudo ln -s "$sv" /var/service
    else
        >&2 echo "No such service: $1"
        false
    fi
}
disable() {
    sv="/var/service/$1"
    if [ -e "$sv" ]; then
        sudo rm "$sv"
    else
        >&2 echo "Service not running: $1"
        false
    fi
}
install() {
    sudo xbps-install -S "$@"
}
uninstall() {
    sudo xbps-remove "$@"
}
alias remove=uninstall
update() {
    sudo xbps-install -Su
}

# Aliases
alias code='code-oss'
alias grep='grep --color=auto'
alias ga='git add'
alias gc='git commit -m'
alias gl='git log --oneline'
alias gr='git restore --staged'
alias gs='git status -sb'
alias la='ls -A --color=auto'
alias ll='ls -lhS --color=auto'
alias ls='ls --color=auto'
alias py='python3'

# Prompt
PS1='\[\e[0;34m\]\W\[\e[m\] > '

# enable vi mode
set -o vi
