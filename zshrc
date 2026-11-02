export PATH=$PATH:$(brew --prefix python)/libexec/bin

ZSH_THEME="af-magic"
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
    aliases
    aws
    catimg
    colorize
    copybuffer
    copyfile
    copypath
    gcloud
    git
    macos
    per-directory-history
    python
    terraform
    thefuck
    z
    zsh-syntax-highlighting
)

source ~/.dotfiles/alias
source ~/.dotfiles/envvars
source ~/.dotfiles/functions
source $ZSH/oh-my-zsh.sh
# source $ZSH_CUSTOM/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit

if ! grep 'pam_tid.so' -q /etc/pam.d/sudo; then
    echo "TouchID PAM module removed during update. Enter password to restore"
    sudo sed -i '' '3i\
auth       sufficient     pam_tid.so
    ' /etc/pam.d/sudo
    sudo -k
fi


export PATH="$PATH:$HOME/.local/bin"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=($HOME/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

alias assume="source $(brew --prefix)/bin/assume"

# AWS profiles managed by Granted
export AWS_CONFIG_FILE="$HOME/.granted/aws-config"
export AWS_DEFAULT_REGION="eu-west-1"
