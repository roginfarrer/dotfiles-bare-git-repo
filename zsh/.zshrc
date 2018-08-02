#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

USER="rfarrer"
DEVBOX="webphp0466.dev.bo1.csnzoo.com"

PARTIALS="/Users/${USER}/.zsh/"
EDITOR="code"
GIT_EDITOR="code --wait"
WORKLOCATION="/Users/${USER}/Wayfair/" # Change to your repos directory

### Imports
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${PARTIALS}settings.zsh
source ${PARTIALS}aliases.zsh
source ${PARTIALS}spaceship.zsh
source ${WORKLOCATION}wf/wf_complete

unsetopt CORRECT                      # Disable autocorrect guesses. Happens when typing a wrong
                                      # command that may look like an existing one.

expand-or-complete-with-dots() {      # This bunch of code displays red dots when autocompleting
  echo -n "\e[31m......\e[0m"         # a command with the tab key, "Oh-my-zsh"-style.
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi