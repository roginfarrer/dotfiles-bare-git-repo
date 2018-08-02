### Exports
export EDITOR="${EDITOR}"
export GIT_EDITOR="${GIT_EDITOR}"
export DEFAULT_USER="${USER}"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=$PATH:$HOME/bin
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/php5/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PATH:`yarn global bin`"
export PATH=”$HOME/platform-tools/bin:$PATH”
export PATH="${WORKLOCATION}wf:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"

### Enable bash completion for git
# This allows git-completion to work properly
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

### Colors
autoload colors; colors

### Set up Fuck https://github.com/nvbn/thefuck
eval "$(thefuck --alias)"

### Run .zsh
. ~/z.sh

### NVM node versioning
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion