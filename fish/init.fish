set -U USER  rfarrer
set -U DEVBOX webphp0466.dev.bo1.csnzoo.com

set EDITOR code
set GIT_EDITOR code --wait
set WORKLOCATION /Users/$USER/Wayfair

set fish_prompt_pwd_dir_length 0

## Functions
function getBranch
  git symbolic-ref --short -q HEAD; or echo "default_value";
end

## Aliases
alias config="code -n ~/dotfiles/fish/init.fish"
alias dotfiles="code -n ~/dotfiles"

### cd into repos
alias res="cd $WORKLOCATION/resources; git status"
alias php="cd $WORKLOCATION/php; git status"
alias temps="cd $WORKLOCATION/templates; git status"
alias res_rs="perl /usr/local/bin/realsync/realsync $WORKLOCATION/resources/"
alias image_rs="perl /usr/local/bin/realsync/realsync $WORKLOCATION/resources_image_storage/"
alias php_rs="perl /usr/local/bin/realsync/realsync $WORKLOCATION/php/"
alias temps_rs="perl /usr/local/bin/realsync/realsync $WORKLOCATION/templates/"
alias turbine_rs="perl /usr/local/bin/realsync/realsync $WORKLOCATION/turbine/"
alias rs="perl /usr/local/bin/realsync/realsync $WORKLOCATION/"

alias g="git"
alias gs="git status"
alias commit="git commit"
alias mycommits="git log --author=USER"
alias branch="git for-each-ref --sort=committerdate refs/heads --color --format='%(HEAD)%(color:bold green)%(committerdate)|%(color:yellow)%(refname:short)|%(color:blue)%(subject)%(color:reset)'|column -ts'|'"
alias staged="git diff --staged"
alias amend="git commit --amend --no-edit"
alias cb="getBranch"
alias frem="git push -f (getBranch)"
alias co="git checkout"
alias gc="git add -A; git commit -m"
alias pull="git pull"
alias push="git push"
alias mpull="git checkout master; git pull"
alias add="git add -A"
alias fetch="git fetch"
alias rename="git branch -m"
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

alias oo='open .' # open current directory in OS X Finder
alias c="clear"
alias sshbox="ssh $DEVBOX"

## Spacefish settings
set -g SPACEFISH_PROMPT_ORDER user dir git exec_time line_sep battery char