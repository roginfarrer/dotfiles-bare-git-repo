alias edit="${EDITOR}"

### Functions
# Quickly restart zsh
restartzsh () { echo "$fg_bold[yellow]Sourcing...$reset_color"; . ~/.zshrc; }

# Delete current branch
deleteBranch() {
  git branch -D $1;
  echo "$fg_bold[red]The local branch '$1' has been deleted.$reset_color";
}

# delete a remote branch
deleteRemoteBranch() {
  git push origin :$1;
  echo "$fg_bold[red]The remote branch '$1' has been deleted.$reset_color";
}

getBranch() {
  git branch --no-color | grep -E '^\*' | awk '{print $2}' \
    || echo "default_value"
  # or
  # git symbolic-ref --short -q HEAD || echo "default_value";
}

### Opens this file
alias zshconfig="${EDITOR} -n ~/.zshrc ${PARTIALS}settings.zsh ${PARTIALS}aliases.zsh"
alias gitconfig="${EDITOR} ~/.gitconfig"
alias gitignore="${EDITOR} ~/.gitignore_global"

### Start Realsync
alias res_rs="perl /usr/local/bin/realsync/realsync ${WORKLOCATION}resources/"
alias image_rs="perl /usr/local/bin/realsync/realsync ${WORKLOCATION}resources_image_storage/"
alias php_rs="perl /usr/local/bin/realsync/realsync ${WORKLOCATION}php/"
alias temps_rs="perl /usr/local/bin/realsync/realsync ${WORKLOCATION}templates/"
alias turbine_rs="perl /usr/local/bin/realsync/realsync ${WORKLOCATION}turbine/"
alias rs="perl /usr/local/bin/realsync/realsync ${WORKLOCATION}"

### cd into repos
alias res="cd ${WORKLOCATION}resources && git status"
alias php="cd ${WORKLOCATION}php && git status"
alias temps="cd ${WORKLOCATION}templates && git status"

### Reviews
alias rbreviews="node ./node_scripts/review.js open --team=frontend"
alias reviews-mine="node ./node_scripts/review.js open --team=css,html,mustache,js,sf:${USER}"
alias reviews-js="node ./node_scripts/review.js open --team=js"

### Command line
alias oo='open .' # open current directory in OS X Finder
alias c="clear"
alias sshbox="ssh ${DEVBOX}"

### Git it!
alias g="git"
alias gs="git status"
alias commit="git commit"
alias mycommits="git log --author=${USER}"
alias branch="git for-each-ref --sort=committerdate refs/heads --color --format='%(HEAD)%(color:bold green)%(committerdate)|%(color:yellow)%(refname:short)|%(color:blue)%(subject)%(color:reset)'|column -ts'|'"
alias staged="git diff --staged"
alias amend="git commit --amend --no-edit"
alias cb="getBranch"
alias frem="git push -f ${cb}"

# Branch actions
alias co="git checkout"
alias gc="git add -A && git commit -m"
alias mom="git checkout master && git pull && git checkout - && git merge master"
alias pull="git pull"
alias push="git push"
alias mpull="git checkout master && git pull"
alias add="git add -A"
alias fetch="git fetch"
alias rename="git branch -m"

# Removal/undo
alias uncommit="git reset --soft HEAD~1"
alias unstage="git reset HEAD"
alias discard="git checkout -- ."
alias delete_remote="deleteRemoteBranch"
alias delete_local="deleteBranch"

# merge actions
alias merge="git merge"
alias squash="git merge --squash"

# Git Logs
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" # prettifies the log
alias gitlogchange="git log --oneline -p" # actual changes
alias gitlogstat="git log --oneline --stat" # number of lines changed
alias gitloggraph="git log --oneline --graph" # graph view of branches

### Create Diffs — don't really need since we have wayrunner
alias res_diff="git diff --full-index master > ~/Desktop/diffs/res.diff"
alias php_diff="git diff --full-index master > ~/Desktop/diffs/php.diff"
alias temps_diff="git diff --full-index master > ~/Desktop/diffs/temps.diff"

### Sass Linting
alias linta="grunt sass-lint" # runs on the entire scss directory
alias lints="grunt sass-lint-s" # runs on your staged changes
alias lint="grunt sass-lint-u" # runs on your unstaged changes

### wf
alias rbpost="wf reviewboard post"
alias rbpost_fast="wayrunner reviewboard post --skip-sniffs --skip-unit -u"
alias trains="wf train list"
alias board="wf train join"
alias detrain="git branch --list | grep deploy_ | xargs git branch -D"

### Food. Run in Resources Repo
alias food="grunt foodtrucks"
alias breakfast="grunt foodtrucks:b"
alias lunch="grunt foodtrucks:l"
alias dinner="grunt foodtrucks:d"

### Testing
alias debugtest="debugTest"
alias testfile="testFiles"
function debugTest() {
  local filePath="$(find . -name $1)"
  node --inspect --debug-brk ./st4/includes/js/tests/runner/run.js -- --files=$filePath
}
function testFiles() {
  local filePath="$(find . -name $1)"
  npm test -- --files=$filePath
}

### Utilities
alias svg="svgo --config='${PARTIALS}/svgo_config.yml'"