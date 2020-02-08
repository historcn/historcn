#!/usr/bin/env bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
if [[ -z $1 ]]; then
  echo "Missing commit message"
  echo "Example: $0 'fixed typo error'"
  exit 1
fi 

[[ -z $1 ]] && echo "Missing commit message" && exit 1


MSG="$1"
HUGO_ENV="production"
rm -rf docs
hugo --gc -d docs || exit 1

cd docs
# Use another ssh key file
ssh-agent bash -c "ssh-add /root/.ssh/id_historcn; 
                    git init;
                    git remote add origin git@github.com:historcn/historcn.github.io.git;
                    git add .; 
                    git commit -m $MSG; 
                    git push -u origin master"

cd .. && rm -rf docs
ssh-agent bash -c "ssh-add /root/.ssh/id_historcn; 
                    git add .; 
                    git commit -m $MSG; 
                    git push -u origin master"
