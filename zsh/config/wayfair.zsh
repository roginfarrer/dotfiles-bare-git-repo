DEVBOX="webphp-146zzq1.dev.bo1.csnzoo.com"

alias sshbox="ssh ${DEVBOX}"

### cd into repos
alias res="cd ${WORKLOCATION}resources && git status"
alias cdphp="cd ${WORKLOCATION}php && git status"

### HB Builds
rebuild () {
  npm run hb-build -- --c=$1
}
rebuildBoth () {
  files=""
  for i in $(echo $1 | sed "s/,/ /g")
  do
    if [ ${#files} -ne 0 ]
    then
      files="$files,"
    fi
    files="${files}admin_$i,extranet_$i"
  done
  echo $files
  rebuild $files
}
wftest () {
  npm run test "$1"
}
wftest-w () {
  npm run test -- --watch --verbose=false $1
}

# Decoupled Repo

alias yw="yarn workspace"
bumpAdex () {
  currentPath=${PWD}
  echo "$fg_bold[red]Bumping Admin version$reset_color"
  cd ${WORKLOCATION}homebase/packages/admin-components && yarn bump  
  echo "$fg_bold[red]Bumping Extranet version$reset_color"
  cd ${WORKLOCATION}homebase/packages/extranet-components && yarn bump
  cd ${currentPath}
}
