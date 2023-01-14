#!/bin/bash
if [[ -z "$1" || "$1" == "--help" || -z "$2" ]]; then
    echo '   Usage: git-change-author "Your Name" "email@address" [SHA1]'
    exit 1
fi
AUTHOR="$1"
EMAIL="$2"
START_HASH="${3:---root}"
echo "On the next screen, you need to change 'pick' to 'edit' for every commit which you wish to alter."
echo ""
echo -n "Press ENTER to continue."
read
git rebase --rebase-merges -i ${START_HASH}
while [ "$?" -eq 0 ]; do
    git -c user.name="${AUTHOR}" -c user.email="${EMAIL}" commit --amend --no-edit --author "${AUTHOR} <${EMAIL}>"
    git rebase --continue
done
git rebase --rebase-merges --committer-date-is-author-date "${START_HASH}"
echo ""
echo ""
echo "Don't forget to run \`git push -f\` - preferably on a test branch first!"
