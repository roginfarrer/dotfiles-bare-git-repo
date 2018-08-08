# Load antibody plugin manager
source <(antibody init)

# Plugin Options
export NVM_LAZY_LOAD=true # Lazy load to improve perf
export NVM_AUTO_USE=true # use .nvmrc if it exists

# Plugins
antibody bundle lukechilds/zsh-nvm
antibody bundle marzocchi/zsh-notify
antibody bundle zsh-users/zsh-completions
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle djui/alias-tips
antibody bundle peterhurford/git-it-on.zsh
antibody bundle eendroroy/zed-zsh
# these should be last!
antibody bundle zdharma/fast-syntax-highlighting
antibody bundle zsh-users/zsh-history-substring-search

# Keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down