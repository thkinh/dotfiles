####### INTERACTIVE SHELL CHECK
# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac
source ~/dotfiles/bash/git-prompt.sh


####### HISTORY CONFIGURATION
# Don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth
# Append to the history file, don't overwrite it
shopt -s histappend
HISTSIZE=3000
HISTFILESIZE=4000


####### SYSTEM SETTINGS
# Check the window size after each command
shopt -s checkwinsize
# Disable terminal bell
bind 'set bell-style none'


####### COLOR SUPPORT & BASIC ALIASES
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -l --color=auto'
    alias dir='dir -l --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Directory & Navigation Aliases
alias ll='ls -lA --group-directories-first'
alias lsd='ls -d .*'
alias cd..='cd ..'
alias cd='cd_func'

# General Utility Aliases
alias vi='vim'
alias cls='clear'
alias rmdir='rm -rf'
alias rm='rm -i'
alias remove='trash-put'
alias open='xdg-open'

# Custom Scripts & Tool Aliases
alias arch='fastfetch -c ~/.config/fastfetch/config.jsonc'
alias dev='~/dotfiles/bash/scripts/dev.sh'
alias fvim='vim $(fzf --height 40%)'
alias fvi='vim $(fzf --height 40%)'
alias refresh='source ~/.bashrc'
alias fr='~/dotfiles/bash/scripts/fr.sh'
alias translate='~/dotfiles/bash/scripts/wtf.sh'


####### CUSTOM FUNCTIONS
open_func() {
    if [ "$1" = "newest" ]; then
        index="${2:-1}"
        target=$(command ls -tA1 --file-type | grep -v '/$' | sed -n "${index}p")
        if [ -z "$target" ]; then
            echo "No file at index $index"
            return 1
        fi
        xdg-open "$target"
        return 0
    fi
    xdg-open "$@"
}

newest_func() {
    index=1
    if [[ "$1" =~ ^[+-]?[0-9]+$ ]]; then
        index=$1
    fi
    command ls -tA1 --file-type | grep -v '/$' | sed -n "${index}p"
}

cd_func() {
  builtin cd "$@" && ls 
}

yank_func() {
    count=0
    mkdir -p ~/.cache/self_created/yanked_files
    for file in "$@"; do
        cp "$file" ~/.cache/self_created/yanked_files/
        ((count++))
        echo "Yanked $count: $file"
    done
}

yanklist_func() {
    if [ "$1" = "clean" ]; then
        rm ~/.cache/self_created/yanked_files/*
        echo "Cleaned"
    fi
    ls ~/.cache/self_created/yanked_files
}

tohere_func() {
    for file in ~/.cache/self_created/yanked_files/*; do
        mv "$file" .
        echo "Moved $file to $(pwd)"
    done
}

mann_func() {
    man "$@" | col -bx | bat --style plain -l man -p
}

man_vim_func() {
    man "$@" | col -bx | vim -R -c 'set ft=man' -
}

# Mapping functions to aliases
alias mann='mann_func'
alias manv='man_vim_func'
alias newest='newest_func'
alias yank='yank_func'
alias yank-list='yanklist_func'
alias tohere='tohere_func'
alias fucking='sudo'



####### DISTRIBUTION SPECIFIC ALIASES
if [ -f /etc/os-release ]; then
    DISTRO=$(grep -w ID /etc/os-release | cut -d '=' -f2 | tr -d '"')
    case "$DISTRO" in
        "debian"*) alias s='apt-cache search' ;;
        "ubuntu"*) alias s='apt search' ;;
        "arch"*)   alias s='yay -Ss' ;;
        *)         alias s='echo "Unknown distribution"' ;;
    esac
else
    echo "OS distribution not found."
fi


####### PROMPT & APPEARANCE
GREEN='\[\e[0;32m\]'
RED='\[\e[0;31m\]'
YELLOW='\[\e[0;33m\]'
CYAN='\[\e[0;36m\]'
GRAY='\[\e[0;90m\]'
RESET='\[\e[0m\]'

conda_prompt() {
    [[ -n "$CONDA_DEFAULT_ENV" ]] && printf "(%s)" "$CONDA_DEFAULT_ENV"
}

PS1="${CYAN}┌-${RESET}\$(conda_prompt) ${RED}[ \t ]${GREEN}[ \u${YELLOW}@${GREEN}\h ]${YELLOW}\$(__git_ps1 '(%s)') ${CYAN}\w\n${CYAN}└─▶${RESET} "


####### EXTERNAL COMPLETIONS & ALIASES
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi 


####### PATHS & SDKS
export PATH=$PATH:$(go env GOPATH)/bin

# Google Cloud SDK
if [ -f '/home/thkinh/repos/google-cloud-sdk/path.bash.inc' ]; then . '/home/thkinh/repos/google-cloud-sdk/path.bash.inc'; fi
if [ -f '/home/thkinh/repos/google-cloud-sdk/completion.bash.inc' ]; then . '/home/thkinh/repos/google-cloud-sdk/completion.bash.inc'; fi


####### MAMBA INITIALIZATION
# Mamba setup
export MAMBA_EXE='/home/thkinh/miniforge3/bin/mamba';
export MAMBA_ROOT_PREFIX='/home/thkinh/miniforge3';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"
fi
unset __mamba_setup


####### SHELL HOOKS & EXTENSIONS
eval "$(direnv hook bash)"
eval "$(zoxide init bash)"
eval "$(fzf --bash)"
