# apparently needed to make powerline font work in fish shell
export LANG=en_US.UTF-8

export VISUAL=nvim
export EDITOR="$VISUAL"

set -g theme_color_scheme base16

# git aliases
alias gst='git status'
alias g='git'
alias gco='git checkout'
alias vim='nvim'

function fish_greeting
  clear
end

pyenv init - | source
