# Bootstrap, only runs if fisher isn't installed
if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

starship init fish | source

set USER = rfarrer

alias vim="nvim"

### Git it!
alias g="git"
alias gs="git status"
alias commit="git commit"
alias mycommits="git log --author=$USER"
alias branch="git for-each-ref --sort=committerdate refs/heads --color --format='%(HEAD)%(color:bold green)%(committerdate:short)|%(color:yellow)%(refname:short)%(color:reset)'|column -ts'|'"
alias staged="git diff --staged"
alias amend="git commit --amend --no-edit"
alias unamend="git reset --soft HEAD@{1}"
alias cb="getBranch"
# alias frem="git push -f ${cb}"
alias co="git checkout"
alias gc="git add -A && git commit -m"
alias mom="git checkout master && git pull && git checkout - && git merge master"
alias pull="git pull"
alias push="git push"
alias mpull="git checkout master && git pull"
alias add="git add -A"
alias fetch="git fetch"
alias renameBranch="git branch -m"
alias uncommit="git reset --soft HEAD~1"
alias unstage="git reset HEAD"
alias discard="git checkout -- ."
alias delete_remote="deleteRemoteBranch"
alias delete_local="deleteBranch"
alias merge="git merge"
alias squash="git merge --squash"
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" # prettifies the log
alias gitlogchange="git log --oneline -p" # actual changes
alias gitlogstat="git log --oneline --stat" # number of lines changed
alias gitloggraph="git log --oneline --graph" # graph view of branches
alias gcp="git cherry-pick"

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'