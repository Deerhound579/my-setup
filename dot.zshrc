# Created by newuser for 5.4.2
# Load antigen
source ~/antigen.zsh;
# Load antigem config
antigen init ~/.antigenrc;

# Pyenv auto startup
export PATH="/home/lisixian/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

zstyle :prompt:pure:virtualenv color yellow
zstyle :prompt:pure:git:branch color green
