# apparently needed to make powerline font work in fish shell
export LANG=en_US.UTF-8

export VISUAL=vim
export EDITOR="$VISUAL"

# for Yubikey SSH
export SSH_AUTH_SOCK=/run/user/(id -u)/gnupg/S.gpg-agent.ssh
gpg-connect-agent updatestartuptty /bye
