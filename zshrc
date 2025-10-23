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
    ripgrep
    terraform
    thefuck
    z
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source ~/.dotfiles/alias
source ~/.dotfiles/envvars
source ~/.dotfiles/functions
source $ZSH/oh-my-zsh.sh
# source $ZSH_CUSTOM/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

eval "$(rbenv init - zsh)"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Bitwarden
# if [ -f "/opt/homebrew/bin/bw" ]; then
#     if [ $(bw status | jq .status) = "\"unauthenticated\"" ]; then
#         echo "Logging in to Bitwarden"
#         export BW_SESSION=$(bw login kieran.smith@itv.com --raw)
#     fi
# fi

autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit

if ! grep 'pam_tid.so' -q /etc/pam.d/sudo; then
    echo "TouchID PAM module removed during update. Enter password to restore"
    sudo sed -i '' '3i\
auth       sufficient     pam_tid.so
    ' /etc/pam.d/sudo
    sudo -k
fi
source ${HOME}/.cyber-dotfiles/.alias
source ${HOME}/.cyber-dotfiles/.envvars

export PATH="$PATH:/Users/kiersmi1/.local/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kiersmi1/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kiersmi1/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kiersmi1/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kiersmi1/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(gh copilot alias -- zsh)"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/kiersmi1/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/kiersmi1/.lmstudio/bin"
# End of LM Studio CLI section

