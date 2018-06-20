###
# Git Functions
###

all_repos () {
  # at the end of this function, we want to return to the directory the command was run from
  local current_location=$(PWD)
  repos=('php' 'resources' 'templates')
  # bash interprets the above as a list, separated by spaces
  for repo in $repos
  do
    # Output the name of the repo it's working with
    echo "$fg_bold[red]\n$repo$reset_color"
    # go there
    cd ${WORKLOCATION}$repo
    # every command typed in after 'all_repos'
    for arg;
    do
      sh -c $arg;
    done
    # we are done working with this repo! (This can be removed if desired)
    echo "$fg_bold[red]/$repo\n$reset_color"
  done
  # bring me back to the starting directory. I can run this from anywhere!
  cd $current_location
}

# # used for 'mom' down the end, but can be run alone
# gitm () { git fetch && git merge origin/master; }
#
# # 'git status' in all repos
# stats () { all_repos "echo $fg[cyan]Status:$reset_color" "git status"; }
#
# # Checkout master and pull latest
# mpull_all () { all_repos "git checkout master" "git pull"; }
#
# # Cleanup
# prune_all () { all_repos "git remote prune origin"; } # Cleanup is important
#
# # Adds all untracked and tracked files to staging, and commits
# # In action:
# #   commit_all "This is my commit message"
# commit_all () { all_repos "git add -A" "echo $fg[green]All files added$reset_color" "git commit -m '$1'" }
#
# # I need the latest and greatest on all branches
# # Don't do with staged changes, or you could run into issues
# # You will get a prompt to write a merge message if you've made changes to a branch since the last time you merged
# # I just normally do `:wq`, but you might feel the need to update it.
# mom () { all_repos "git fetch && git merge origin/master"; }
#
# # new feature: checks out given branch name on each repo
# newf () { all_repos "git checkout master" "git pull" "git checkout -b $1 origin/master"; }
#
# # go to branch: checks out given branch on each repo
# coall () { all_repos "git checkout $1"; }
#
# # delete branch on each repo. BE CAREFUL
# delbr () { all_repos "git checkout master" "git branch -D $1"; }

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

# create a remote branch and set upstream
createRemoteBranch() {
  git push -u origin $1;
}
