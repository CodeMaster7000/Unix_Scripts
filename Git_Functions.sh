function delete_gone_branches() {
    if [[ "$#" -ne 1 ]]; then
        echo "Exactly one argument needed: path to the directory."
        return 1
    fi
    dir=${1}
    make_heading ${dir}
    if [[ ! -d ${dir} ]]; then
        echo "${dir} is not a valid path."
        return 1
    fi
    if [[ ${dir} != '.' ]]; then
        pushd ${dir}
    fi
    if [[ -d .git ]]; then
        git fetch -p
        git branch -v | grep gone | awk -F' ' '{print $1}' | xargs -I{} -P 4 -- git branch -D {}
    else
        echo "It is not a git repository."
    fi
    if [[ ${dir} != '.' ]]; then
    popd
    fi
}
function removeBranchesFromRemote() {
    padding="                "
    date=$(gum input --value $(date '+%Y-%m-%d') --placeholder "Older than?")
    if [[ -z "$date" ]]; then
        echo "Date cannot be empty."
        return
    fi
    old_branches=""
    function populateOldBranches() {
        for remote_branch in $(git branch -r | grep -v "HEAD\|develop\|master\|main\|release*" | sed /\*/d); do
            if [[ -z "$(git log -1 --since=\"${date}\" -s ${remote_branch})" ]]; then
                author=$(git show --format="%an" ${remote_branch} | head -n 1)
                age=$(git show --format="%cr" ${remote_branch} | head -n 1)
                branch=$(echo ${remote_branch} | sed 's#origin/##')
                old_branches+='\n'$(printf "%s|%s|%s\n" \
                    "${author}${padding:${#author}}" \
                    "${age}${padding:${#age}}" \
                    "${branch}")
            fi
        done
    }
    populateOldBranches
    if [[ -n $old_branches ]]; then
        branchesToBeDeleted=$(echo $old_branches | gum choose --no-limit | awk -F'|' '{print $3}')
        if [[ -n $branchesToBeDeleted ]]; then
            echo $branchesToBeDeleted
            gum confirm "Delete aforementioned branches from remote?" &&
                echo $branchesToBeDeleted | xargs -P 8 -I{} -- git push origin --delete {}
        fi
    else
        echo "No branch older than ${date} found."
    fi
}
