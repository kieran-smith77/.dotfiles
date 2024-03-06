ZSH_THEME="af-magic"
# DISABLE_UPDATE_PROMPT="true"
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
if [ -f "/usr/local/bin/bw" ]; then
   if [ $(bw status | jq .status) = "\"unauthenticated\"" ]; then
      echo "Logging in to Bitwarden"
      export BW_SESSION=$(bw login kieran.smith@itv.com --raw) 
   fi
fi

autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit

# BEGIN_AWS_SSO_CLI

__aws_sso_profile_complete() {
     local _args=${AWS_SSO_HELPER_ARGS:- -L error}
    _multi_parts : "($(/opt/homebrew/bin/aws-sso list --csv $_args Profile))"
}

aws-sso-profile() {
    local _args=${AWS_SSO_HELPER_ARGS:- -L error}
    if [ -n "$AWS_PROFILE" ]; then
        echo "Unable to assume a role while AWS_PROFILE is set"
        return 1
    fi
    eval $(/opt/homebrew/bin/aws-sso $_args eval -p "$1")
    if [ "$AWS_SSO_PROFILE" != "$1" ]; then
        return 1
    fi
}

aws-sso-clear() {
    local _args=${AWS_SSO_HELPER_ARGS:- -L error}
    if [ -z "$AWS_SSO_PROFILE" ]; then
        echo "AWS_SSO_PROFILE is not set"
        return 1
    fi
    eval $(/opt/homebrew/bin/aws-sso -sso eval $_args -c)
}

compdef __aws_sso_profile_complete aws-sso-profile
complete -C /opt/homebrew/bin/aws-sso aws-sso

# END_AWS_SSO_CLI

if ! grep 'pam_tid.so' -q /etc/pam.d/sudo;
then
    echo "TouchID PAM module removed during update. Enter password to restore"
    sudo sed -i '' '3i\
auth       sufficient     pam_tid.so
    ' /etc/pam.d/sudo
    sudo -k
fi
source ${HOME}/.cyber-dotfiles/.alias
source ${HOME}/.cyber-dotfiles/.envvars
source /Users/kiersmi1/.cyber-dotfiles/.alias
source /Users/kiersmi1/.cyber-dotfiles/.envvars
