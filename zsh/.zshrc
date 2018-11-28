USER="rfarrer"

PARTIALS="/Users/${USER}/.zsh/"
EDITOR="code"
GIT_EDITOR="code --wait"
WORKLOCATION="/Users/${USER}/Wayfair/"

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
