npm init -y 
npm i express
node index.js

# Initialize a new Git repository in the current directory. 
# This creates a .git directory.
git init

# Add all files in the current directory to the staging area.
#  This prepares them to be committed.
git add .

# Commit the staged files to the repository with a message "first commit". 
#This records the changes in the repository's history.
git commit -m "first commit"

# Rename the default branch to "main". 
git branch -M main

# Add a new remote repository with the name "origin". 
#The URL provided is the location of your remote repository on GitHub.
git remote add origin https://github.com/mihirh19/dockerpipeline.git

# Push the changes from the local "main" branch to the remote repository. 
# The -u flag sets the remote "origin" as the default for the current branch.
git push -u origin main
