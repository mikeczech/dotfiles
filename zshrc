export TERM="xterm-256color"
export ZSH=/Users/mczech/.oh-my-zsh

ZSH_THEME="agnoster_short_prompt"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
export TERM_PROGRAM=iTerm.app
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
export GIT_EDITOR=nvim

# Set personal aliases, overriding those provided by oh-my-zsh libs,
alias ll='ls -l'
alias jhpass='/Users/mczech/Documents/Projects/JH/repositories/globus-password-store/go pass'
alias jh-jumphost='/Users/mczech/Documents/Projects/JH/ssh_jumphost_aws.sh'
alias clang-tidy='/usr/local/opt/llvm/bin/clang-tidy'
alias vim='nvim'

# Make history almost infinite
export HISTFILE=~/.zsh_history
export HISTSIZE=9999999
export SAVEHIST=$HISTSIZE

# Setup AWS access
export AWS_REGION="eu-central-1"
export AWS_DEFAULT_REGION="${AWS_REGION}"

# Setup the C/C++ compiler
#export CC="/usr/local/bin/gcc-6"
#export CXX="/usr/local/bin/g++-6"
#export CC="/usr/bin/clang"
#export CXX="/usr/bin/clang++"
export CC="/usr/local/opt/llvm/bin/clang"
export CXX="/usr/local/opt/llvm/bin/clang++"

# Make go apps accessible from PATH
export GOPATH="/Users/mczech/go"
export PATH="$PATH:$GOPATH/bin"

# Make history unique across all terminals
setopt inc_append_history
setopt share_history

# Allow wildcards in arguments
unsetopt nomatch

# Launch SSH agent if not running
pgrep ssh-agent >/dev/null || ssh-agent > ~/.ssh-agent-conf

source ~/.ssh-agent-conf

# Init rbenv
eval "$(rbenv init -)"

# Helper functions for the pet command-line manager
function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}
function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N pet-select
bindkey '^s' pet-select

# Neovim autocd
neovim_autocd() {
  [[ $NVIM_LISTEN_ADDRESS ]] && python ~/.scripts/neovim-autocd.py
}
chpwd_functions+=( neovim_autocd )

# Use GPG agent for SSH
# export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
