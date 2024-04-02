whogit() {
    git log --author="$1"
}

pupu() {
    git pull origin "$1" --rebase && git push origin "$1"
}

pst() {
    git stash; git pull origin "$1" --rebase; git push origin "$1"; git stash pop
}

pl() {
    git pull origin "$1" --rebase
}

psh() {
    git push origin "$1" --rebase
}

prb() {
  git push origin :"$1"; git push origin "$1";
}

gif() {
    git grep --cached "$1"
}

gsf() {
    git diff-tree --no-commit-id --name-only -r "$1"
}

g_diff() {
    git --no-pager diff
}

# get a branch name
brnch() {
    git --no-pager branch | sed "s/\*/ /" | fzf
}
