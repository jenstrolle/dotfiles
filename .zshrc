### much of this file is taken from https://bit.ly/3HbFgPc

# Add to PATH
export PATH="/usr/local/texlive/2022/bin/x86_64-linux:$PATH"

# Add to MANPATH
export MANPATH="/usr/local/texlive/2022/texmf-dist/doc/man:$MANPATH"

# Add to INFOPATH
export INFOPATH="/usr/local/texlive/2022/texmf-dist/doc/info:$INFOPATH"

# irace

export IRACE_HOME=/home/trolle/R/x86_64-pc-linux-gnu-library/4.1/irace/bin
export PATH=${IRACE_HOME}:$PATH


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Change default colors
export TERM="xterm-256color"

# Set name of the theme to load
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Which plugins would you like to load?
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

## wal https://bit.ly/3pvl5Vy2
# sets theme on terminal startup
# default theme base16-solarized
(cat ~/.cache/wal/sequences &)

# User configuration
# update upgrade alias
alias upup="sudo apt-get update && sudo apt-get upgrade -y"

# alias for "with fzf"
alias -g Z='| fzf' 

# YEET
alias yeet='git push'

# synctex support
alias vim="vim --servername VIM"

## FZF options
# for more fzf options (namely fd instead of find), see fzf git page
# source from .fzf.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# set fzf defaults
## long preview str explained here https://bit.ly/35IT061
export FZF_DEFAULT_OPTS="--layout=reverse
--border 
--height 60%
--multi
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--bind '?:toggle-preview'
--extended
"

# z, but with fzf for unrecognized folders
unalias z 2> /dev/null
z() {
    [ $# -gt 0 ] && _z "$*" && return
    cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

# pomodoro timer in terminal
declare -A pomo_options
pomo_options["work"]="25"
pomo_options["break"]="5"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  timer ${pomo_options["$val"]}m
  notify-send --app-name=Pomodoro "'$val' session done"
  fi
}

alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"

cycle_work_break(){
    for i in $(seq $1); do
        wo
        br
    done
}

alias pc=cycle_work_break


export PATH=$PATH:$HOME/.local/bin
