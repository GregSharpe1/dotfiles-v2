export EDITOR='vim'
export ZSH=$HOME/.oh-my-zsh
export GOPATH=$HOME/go
export BROWSER="/usr/bin/brave"
# thefuck
eval $(thefuck --alias)

ZSH_THEME="spaceship"

plugins=(
  aws
  shrink-path
  git
  tig
  zsh-syntax-highlighting
  zsh-autosuggestions
  z
  terraform
  thefuck
  ssh-agent
)

ZSH_DISABLE_COMPFIX=true

# Virtual Env
SPACESHIP_VENV_PREFIX=""
SPACESHIP_VENV_SUFFIX=" "
SPACESHIP_VENV_SYMBOL=" "

# Custom AWS module
SPACESHIP_CUSTOM_AWS_SHOW="true"
SPACESHIP_CUSTOM_AWS_PREFIX=""
SPACESHIP_CUSTOM_AWS_SUFFIX=" "
SPACESHIP_CUSTOM_AWS_SYMBOL="☁️·"
SPACESHIP_CUSTOM_AWS_COLOR="150"

spaceship_custom_aws() {
  [[ $SPACESHIP_CUSTOM_AWS_SHOW == false ]] && return

  # Check if the AWS-cli is installed
  spaceship::exists aws || return

  # Is the current profile not the default profile
  [[ -z $AWS_PROFILE ]] || [[ "$AWS_PROFILE" == "default" ]] && return

  # Show prompt section
  spaceship::section \
    "$SPACESHIP_CUSTOM_AWS_COLOR" \
    "$SPACESHIP_CUSTOM_AWS_PREFIX" \
    "$SPACESHIP_CUSTOM_AWS_SYMBOL $AWS_PROFILE" \
    "$SPACESHIP_CUSTOM_AWS_SUFFIX" \
}

# Custom Terraform module
SPACESHIP_CUSTOM_TERRAFORM_SHOW="true"
SPACESHIP_CUSTOM_TERRAFORM_PREFIX=""
SPACESHIP_CUSTOM_TERRAFORM_SUFFIX=" "
SPACESHIP_CUSTOM_TERRAFORM_SYMBOL="🛠"
SPACESHIP_CUSTOM_TERRAFORM_COLOR="105"

spaceship_custom_terraform() {

  # If the .terraform dir doesn't exist exit
  [[ $SPACESHIP_CUSTOM_TERRAFORM_SHOW == false ]] || [[ ! -d ".terraform/" ]] && return

  # Check if terraform is installed
  spaceship::exists terraform || return

  TERRAFORM_WORKSPACE="$(terraform workspace show)"

  # If the terraform workspace is default ignore
  [[ "$TERRAFORM_WORKSPACE" == "default" ]] && return

  # show section
  spaceship::section \
    "$SPACESHIP_CUSTOM_TERRAFORM_COLOR" \
    "$SPACESHIP_CUSTOM_TERRAFORM_PREFIX" \
    "$SPACESHIP_CUSTOM_TERRAFORM_SYMBOL $TERRAFORM_WORKSPACE" \
    "$SPACESHIP_CUSTOM_TERRAFORM_SUFFIX" \
}

SPACESHIP_CUSTOM_TIMESTAMP_SHOW="true"
SPACESHIP_CUSTOM_TIMESTAMP_PREFIX=""
SPACESHIP_CUSTOM_TIMESTAMP_SUFFIX=" "
SPACESHIP_CUSTOM_TIMESTAMP_SYMBOL=""
SPACESHIP_CUSTOM_TIMESTAMP_COLOR="300"

spaceship_custom_timestamp() {
  spaceship::exists date || return

  CURRENT_TIMESTAMP=$(date +%H:%M:%S)

  spaceship::section \
    "$SPACESHIP_CUSTOM_TIMESTAMP_COLOR" \
    "$SPACESHIP_CUSTOM_TIMESTAMP_PREFIX" \
    "$SPACESHIP_CUSTOM_TIMESTAMP_SYMBOL $CURRENT_TIMESTAMP" \
    "$SPACESHIP_CUSTOM_TIMESTAMP_SUFFIX"
}

# Character
SPACESHIP_CHAR_SYMBOL=""

SPACESHIP_CUSTOM_KUBECONTEXT_SHOW="true"
SPACESHIP_CUSTOM_KUBECONTEXT_PREFIX=""
SPACESHIP_CUSTOM_KUBECONTEXT_SUFFIX=" "
SPACESHIP_CUSTOM_KUBECONTEXT_SYMBOL=""
SPACESHIP_CUSTOM_KUBECONTEXT_COLOR="105"

spaceship_custom_kubecontext() {
  [[ $SPACESHIP_CUSTOM_KUBECONTEXT_SHOW == false ]] && return
  # Check that kubectl is installed
  spaceship::exists kubectl || return

  # Show KUBECONTEXT status only for folders with .kube and file config inside.
  local kube_context=$(kubectl config current-context 2>/dev/null)
  [[ -z $kube_context ]] && return
  local kube_namespace=$(kubectl config view | grep namespace | awk '{print $2}')
  [[ -z $kube_namespace ]] && return

  spaceship::section \
    "$SPACESHIP_CUSTOM_KUBECONTEXT_COLOR" \
    "$SPACESHIP_CUSTOM_KUBECONTEXT_PREFIX" \
    "${SPACESHIP_CUSTOM_KUBECONTEXT_SYMBOL}${kube_context} (${kube_namespace})" \
    "$SPACESHIP_CUSTOM_KUBECONTEXT_SUFFIX"
}
# DIR
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_DIR_TRUNC=0


SPACESHIP_RPROMPT_ORDER=(
  custom_timestamp
  docker
  custom_kubecontext
  custom_aws
  custom_terraform
  venv
)

SPACESHIP_PROMPT_ORDER=(
  user
  dir
  host
  git
  line_sep
  exit_code
  char
)

source $ZSH/oh-my-zsh.sh

AGENT_SOCK=$(gpgconf --list-dirs | grep agent-socket | cut -d : -f 2)
if [[ ! -S $AGENT_SOCK ]]; then
  gpg-agent --daemon --use-standard-socket &>/dev/null
fi
export GPG_TTY=$TTY

# Set SSH to use gpg-agent if it's enabled
GNUPGCONFIG="${GNUPGHOME:-"$HOME/.gnupg"}/gpg-agent.conf"
if [[ -r $GNUPGCONFIG ]] && command grep -q enable-ssh-support "$GNUPGCONFIG"; then
  export SSH_AUTH_SOCK="$AGENT_SOCK.ssh"
  unset SSH_AGENT_PID
fi

# source alises
for f in $(find $HOME/.alias/*.alias -type f); do source $f; done

# Kubectl autocompletion
if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi
# Flux completion
if [ $commands[flux] ]; then source <(flux completion zsh); fi
# Gitops Toolkit (FluxV2)
# if [ $commands[gotk] ]; then source <(gotk completion); fi
# Helm autocompletion
if [ $commands[helm] ]; then source <(helm completion zsh); fi

# Source the Ruby gems
PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# Nielsen scripts directory
PATH="$PATH:$HOME/work/nlsn/nielsen-bin"

# Custom scripts
PATH="$PATH:$HOME/.scripts/"

# Kubectl Krew PATH https://github.com/kubernetes-sigs/krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Direnv Nielsen stuff
eval "$(direnv hook $SHELL)"
# source $HOME/src/bash/1pass-signin.sh
