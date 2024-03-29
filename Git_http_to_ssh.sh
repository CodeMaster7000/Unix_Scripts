#!/bin/bash
function git_http_to_ssh {
    local name=${1}
    local name=${name:=origin}
    local url=$( git remote get-url $name )
    [[ "$url" =~ (http[s]?)://(.+)/(.+)/(.+)(\.git)? ]]
    local protocol="${BASH_REMATCH[1]}"
    if [ \( "$protocol" == "http" \) -o \( "$protocol" == "https" \) ] ;then
      local provider="${BASH_REMATCH[2]}"
      local team="${BASH_REMATCH[3]}"
      local prj="${BASH_REMATCH[4]}"
      local ext="${BASH_REMATCH[5]}"
      company=$(fgrep Host ~/.ssh/config | fgrep -v Hostname | cut -d' ' -f2)
      if [ X"${company}" != "X" -a X"${provider}" == "Xbitbucket.org" -a -f "~/.ssh/id_rsa_${team}" ] ;then
        provider="${company}"
      fi
      git remote set-url        $name "git@${provider}:${team}/${prj}${ext}"
      git remote set-url --push $name "git@${provider}:${team}/${prj}${ext}"
    fi
}
git_http_to_ssh $@
