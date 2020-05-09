# Created by newuser for 5.4.2
# Load antigen
source ~/antigen.zsh;
# Load antigem config
antigen init ~/.antigenrc;
# Load aliases
. ~/.zsh_alias
# Pyenv auto startup
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

zstyle :prompt:pure:virtualenv color yellow
zstyle :prompt:pure:git:branch color green
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
alias typora="open -a typora"
alias makevideodel="ffmpeg -framerate 30 -pattern_type glob -i '*.png' output.mp4 && rm *.png"
# ===============================
# Path
# ===============================
export PATH=/Users/lisixian/.local/bin:$PATH
export DISPLAY=:0
# export TERM=screen-256color
# added by travis gem
[ -f /Users/lisixian/.travis/travis.sh ] && source /Users/lisixian/.travis/travis.sh
# function for compiling c++ program
tomain(){
    g++ -O2 -std=c++11 "$1" -o main && ./main
}

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

