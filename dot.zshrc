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
# added by travis gem
# [ -f /Users/lisixian/.travis/travis.sh ] && source /Users/lisixian/.travis/travis.sh
# function for compiling c++ program
tomain(){
    g++ -std=c++11 "$1" -o main && ./main
}

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

# export NVM_DIR="/Users/lisixian/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/lisixian/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/lisixian/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/lisixian/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/lisixian/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

