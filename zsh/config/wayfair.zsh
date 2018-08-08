DEVBOX="webphp0466.dev.bo1.csnzoo.com"

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
alias php="cd ${WORKLOCATION}php && git status"
alias temps="cd ${WORKLOCATION}templates && git status"

### Reviews
alias rbreviews="node ./node_scripts/review.js open --team=frontend"
alias reviews-mine="node ./node_scripts/review.js open --team=css,html,mustache,js,sf:${USER}"
alias reviews-js="node ./node_scripts/review.js open --team=js"