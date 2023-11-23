#!/bin/bash

BRANCHES=$(git branch --merged master | egrep -v "(^\*|master)")
if [ -z "$BRANCHES" ]; then
  echo "Found no branch to delete"
  exit
fi

function delete_branches() {
    echo $BRANCHES | xargs git branch -d
}

function delete_remote_branches() {
    echo $BRANCHES | xargs git push --delete origin
    git remote prune origin
}

echo "Are you sure you want to delete these branches?"
echo $BRANCHES | tr " " "\n"
printf "\n"

select yn in "Yes" "No"; do
    case $yn in
        Yes ) delete_branches; break;;
        No ) exit;;
    esac
done

echo "Do you also want to delete the remote tracking branches?"

select yn in "Yes" "No"; do
    case $yn in
        Yes ) delete_remote_branches; break;;
        No ) exit;;
    esac
done
