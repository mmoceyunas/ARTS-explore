### Git commands ###

#new local git repo from a repo on GitHub
git clone http://...

#check remote was cloned successfully
git remote --verbose

#stage local changes, commit
git add foo.txt
git commit --message "A commit message"

#check on the state of the Git world
git status
git log
git log --oneline

#compare versions
git diff

#adde a remote to existing local repo
git remote add origin http://. . . 
git remote --verbose
git remote show origin

#push local main to GitHub main and have local main track main on GitHub
git push --set-upstream origin main
#shorter form
git push -u origin main

#regular push
git push
git push origin main

#pull commits from GitHub
git pull

#pull commits and don't let it put you in a merge conflict pickle
git pull --ff-only

#fetch commits
git fetch

#switch to a branch
git checkout [branch-name]

#check remote and branch tracking
git remote -v
git remote show origin
git branch -vv


