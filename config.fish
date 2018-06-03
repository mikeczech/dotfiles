# apparently needed to make powerline font work in fish shell
export LANG=en_US.UTF-8

export VISUAL=nvim
export EDITOR="$VISUAL"

set -gx PATH ~/.gem/ruby/2.5.0/bin $PATH
set -gx PATH ~/go/bin $PATH

# for Yubikey SSH
export SSH_AUTH_SOCK=/run/user/(id -u)/gnupg/S.gpg-agent.ssh
gpg-connect-agent updatestartuptty /bye > /dev/null

# git aliases
alias gst='git status'
alias g='git'
alias gco='git checkout'
alias vim='nvim'

# run pet-select with ctrl-s
function fish_user_key_bindings
  bind \cs 'pet-select'
end
