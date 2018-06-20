USER="rfarrer"
DEVBOX="webphp0466.dev.bo1.csnzoo.com"

PARTIALS="/Users/${USER}/.zsh/"
EDITOR="code"
GIT_EDITOR="code --wait"
WORKLOCATION="/Users/${USER}/Wayfair/" # Change to your repos directory

### Imports
source ${PARTIALS}settings.zsh
source ${PARTIALS}aliases.zsh
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh
source ${WORKLOCATION}wf/wf_complete

if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi

### NVM node versioning
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion