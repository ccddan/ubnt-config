# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ":omz:update" mode disabled  # disable automatic updates
# zstyle ":omz:update" mode auto      # update automatically without asking
zstyle ":omz:update" mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ":omz:update" frequency 15

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  colored-man-pages
  command-not-found
  zsh-autosuggestions
  history
  dirhistory
  web-search
  zsh-syntax-highlighting
  zsh-interactive-cd
  docker
  docker-compose
  kubectl
  minikube
  terraform
  ansible
  helm
  vagrant
  vault
  nomad
  aws
  rust
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#######################################################################
####                            ALIASES                            ####
#######################################################################

alias ll="ls -las"

# ZSH
alias zshconfig="nano ~/.zshrc"
alias ohmyzsh="nano ~/.oh-my-zsh"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Monitor Brightness
alias brightness='xrandr --output $(xrandr | grep " connected" | cut -f1 -d " ") --brightness'

# Git
alias gdf="git diff"
alias gad="git add"
alias gco="git checkout"
alias gre="git reset"
alias gcom="git commit"
alias gtg="git tag"
alias gst="git status"
alias gbr="git branch"
alias glsf="git ls-files -s"
alias glg='git log --all --pretty=format:"%h %cd %s (%an)" --since="15 days ago"'
alias ghist='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
alias gtype="git cat-file -t"
alias gdump="git cat-file -p"
alias gsh="git push"
alias gpl="git pull"
alias gint="git init"
alias gcnf="git config"
alias gfl="git flow" # requires git flow plugin installation
alias gff="git flow feature"
alias gffs="git flow feature start"
alias gfff="git flow feature finish"
alias gfr="git flow release"
alias gfrs="git flow release start"
alias gfrf="git flow release finish"
alias gfh="git flow hotfix"
alias gfhs="git flow hotfix start"
alias gfhf="git flow hotfix finish"

# Docker
alias dkr="docker"
alias dkrc="docker-compose"

# Kernel Update Utility
# INSTRUCTIONS:
# 1. wget https://raw.githubusercontent.com/pimlie/ubuntu-mainline-kernel.sh/master/ubuntu-mainline-kernel.sh
# 2. sudo install ubuntu-mainline-kernel.sh /usr/local/bin/
#
# Usage: $ sudo update-kernel
alias update-kernel="ubuntu-mainline-kernel.sh -i"

# Terraform
alias tf11="$HOME/apps/terraform/0.11.14/terraform"
alias tf12="$HOME/apps/terraform/0.12.31/terraform"
alias tf13="$HOME/apps/terraform/0.13.3/terraform"
alias tf1="$HOME/apps/terraform/1.0.5/terraform"
alias tf="tf1"

alias tfi="tf init"
alias tfmt="tf fmt"
alias tfap="tf apply"
alias tfapy="tf apply -auto-approve"
alias tfd="tf destroy"
alias tfdy="tf destroy -auto-approve"
alias tfp="tf plan"
alias tfv="tf validate"

# Packer
alias packer="$HOME/apps/packer/packer"
alias pkr="packer"

# AWS Kubectl
alias awskctl="$HOME/apps/aws-kubectl/kubectl"

# Kubectl
alias kctl="$HOME/apps/kubectl/kubectl"
alias kubectl="kctl"
alias k="kctl"

alias kc="kctl create"

alias kg="kctl get"
alias kgp="kctl get pods"
alias kgs="kctl get services"
alias kgd="kctl get deployments"
alias kgrs="kctl get rs"
alias kgsts="kctl get sts"
alias kgn="kctl get nodes"
alias kgns="kctl get namespaces"

alias klg="kctl logs"

alias kd="kctl describe"
alias kdp="kctl describe pod"
alias kds="kctl describe service"
alias kdd="kctl describe deployment"
alias kdrs="kctl describe rs"
alias kdsts="kctl describe sts"
alias kdn="kctl describe node"
alias kdns="kctl describe namespace"

alias kap="kctl apply"
alias kdes="kctl destroy"

alias kdel="kctl delete"
alias kdelp="kctl delete pod"
alias kdeld="kctl delete deployment"
alias kdels="kctl delete service"
alias kdelrs="kctl delete rs"
alias kdelsts="kctl delete sts"
alias kdeln="kctl delete node"
alias kdelns="kctl delete ns"

# Minikube
export PATH="$HOME/apps/minikube/:$PATH"
alias mkube="minikube"

# Helm
alias helm="$HOME/apps/helm/helm"

# Robo 3T (MongoDB GUI)
alias robo3t="$HOME/apps/robo3t/bin/robo3t"

# Ganache
alias ganache="$HOME/apps/ganache/ganache.appimage"

# Neo Vim
alias nvim5="$HOME/apps/neovim/nvim5.appimage"
alias nvim="$HOME/apps/neovim/nvim7.appimage"
alias vim="nvim -N"
export MYVIMRC="~/.config/nvim/init.vim"

# Nano
alias nano="nano -milwgMEL"

# VS Code
alias code='GTK_IM_MODULE="xim" code'

#######################################################################
####                         ALIASES - END                         ####
#######################################################################

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## Fix issues with SSH in WSL every time a new terminal/session/panel is opened
eval "$(ssh-agent -s)" > /dev/null 2>&1
ssh-add ~/.ssh/me/me-gh > /dev/null 2>&1


# Rust
. "$HOME/.cargo/env"

# Solana CLI
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
# Anchor
export PATH="$HOME/.avm/bin:$PATH"

# Pyenv Configuration
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Nodeenv
export PATH="$USER/.local/bin:$PATH"

# Nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"
source "$HOME/.nodenv/completions/nodenv.zsh"

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# NVIM/FZF
# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude ".git,node_modules,target,.env*,__py*,cdk.out,env,venv,*.egg-info,python"'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


#######################################################################
####                    CUSTOM LOCAL CONFIG                        ####
#######################################################################
