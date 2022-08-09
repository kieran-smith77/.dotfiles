ZSH_THEME="af-magic"
DISABLE_UPDATE_PROMPT="true"
ENABLE_CORRECTION="true"
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

source ~/.dotfiles/.alias
source ~/.dotfiles/.envvars
source ~/.dotfiles/.functions
source ~/.cyber-dotfiles/.alias
source $ZSH/oh-my-zsh.sh

eval "$(rbenv init - zsh)"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
