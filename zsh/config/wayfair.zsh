DEVBOX="webphp-146zzq1.dev.bo1.csnzoo.com"

alias sshbox="ssh ${DEVBOX}"

### Start Realsync
alias res_rs="perl /usr/local/bin/realsync/realsync ${WORKLOCATION}resources/"
alias image_rs="perl /usr/local/bin/realsync/realsync ${WORKLOCATION}resources_image_storage/"
alias php_rs="perl /usr/local/bin/realsync/realsync ${WORKLOCATION}php/"
alias temps_rs="perl /usr/local/bin/realsync/realsync ${WORKLOCATION}templates/"
alias turbine_rs="perl /usr/local/bin/realsync/realsync ${WORKLOCATION}turbine/"
alias rs="perl /usr/local/bin/realsync/realsync ${WORKLOCATION}"

### cd into repos
alias res="cd ${WORKLOCATION}resources && git status"
alias cdphp="cd ${WORKLOCATION}php && git status"
alias temps="cd ${WORKLOCATION}templates && git status"

### Reviews
alias rbreviews="node ./node_scripts/review.js open --team=frontend"
alias reviews-mine="node ./node_scripts/review.js open --team=css,html,mustache,js,sf:${USER}"
alias reviews-js="node ./node_scripts/review.js open --team=js"

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
