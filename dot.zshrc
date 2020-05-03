# Created by newuser for 5.4.2
# Load antigen
source ~/antigen.zsh;
# Load antigem config
antigen init ~/.antigenrc;

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
alias makevideo="ffmpeg -framerate 30 -pattern_type glob -i '*.png' -vcodec libx264 -pix_fmt yuv420p movie.mp4"
alias jrnlv="jrnl -n 3"
alias jrnle="jrnl -n --edit"
export PATH=/Users/lisixian/.local/bin:$PATH
export DISPLAY=:0
# added by travis gem
[ -f /Users/lisixian/.travis/travis.sh ] && source /Users/lisixian/.travis/travis.sh
