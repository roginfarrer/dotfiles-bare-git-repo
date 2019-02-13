USER="rfarrer"

PARTIALS="/Users/${USER}/.zsh/"
EDITOR="code"
GIT_EDITOR="code --wait"
WORKLOCATION="/Users/${USER}/Wayfair/"

export EDITOR="${EDITOR}"
export GIT_EDITOR="${GIT_EDITOR}"
export DEFAULT_USER="${USER}"

### Imports
# Order is important!
source ${PARTIALS}wayfair.zsh
source ${PARTIALS}settings.zsh
source ${PARTIALS}plugins.zsh
source ${PARTIALS}aliases.zsh
source ${PARTIALS}spaceship.zsh

# https://stackoverflow.com/a/9810485
__git_files () {
    _wanted files expl 'local files' _files
}

if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi

eval $(thefuck --alias)