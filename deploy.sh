#!/usr/bin/env bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
if [[ -z $@ ]]; then
  echo "Missing commit message"
  echo "Example: $0 'fixed typo error'"
  exit 1
fi 

MSG="$@"
HUGO_ENV="production"
rm -rf docs
hugo --gc -d docs || exit 1

cd docs && scp ../README.md ./
# Use another ssh key file
ssh-agent bash -c "ssh-add ~/.ssh/id_historcn; 
                    git config user.name "Historcn";
                    git config user.name "historcn@gmail.com";
                    git init;
                    git remote add origin git@github.com:historcn/historcn.github.io.git;
                    git add .; 
                    git commit -m '$MSG'; 
                    git push -u origin master --force"

cd .. && rm -rf docs
ssh-agent bash -c "ssh-add ~/.ssh/id_historcn; 
                    git config user.name "Historcn";
                    git config user.name "historcn@gmail.com";
                    git add .; 
                    git commit -m '$MSG'; 
                    git push -u origin master"
