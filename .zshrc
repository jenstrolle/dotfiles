### much of this file is taken from https://bit.ly/3HbFgPc

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Change default colors
export TERM="xterm-256color"

# Set name of the theme to load
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

## see 'man strftime' for details.
#HIST_STAMPS="dd/mm/yyyy"

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


export PATH=$PATH:$HOME/.local/bin
