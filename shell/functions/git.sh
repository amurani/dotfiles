whogit() {
    git log --author="$1"
}

pupu() {
    git pull origin "$1" --rebase && git push origin "$1"
}

gfecho() {
    git fetch origin "$1" && git checkout "$1"
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
    git --no-pager branch | ack '\*' | sed "s/\*//"
}

# get a branch name pretty
brnch_p() {
    brnch | xargs -I {} zsh -c 'echo -e "\e[1;32m  {} \e[0m"'
}
# [g]it [b]branch [p]ick
gbp() {
    git --no-pager branch | sed "s/\*/ /" | fzf
}

# [g]it [s]tatus [p]ick
gsp() {
    git status -s | awk "{ print \$2 }" \
        | fzf --multi --preview "git --no-pager diff {} | bat --style=numbers --color=always --line-range :500 -p"
}

gaf() {
    git add $(gsp) # [g]it [a]dd via [f]zf
}

gbf() {
    git checkout $(gbp) # [g]it checkout [b]ranch via [f]zf
}

grstd() {
    git restore --staged $(gsp) # [g]it [r]estore [st]age[d]
}

# [g]it [st]a[sh] [pr]eview
gstshpr() {
    git --no-pager stash list \
        | awk '{print $1}' | sed 's/://' \
        | fzf --preview "git --no-pager -p show {} | bat --style=numbers --color=always --line-range :500 -p"
}

# [g]it [st]a[sh] [p]op
gstshp() {
    git stash pop $(gstshpr)
}

gmsg() {
    git show --format=%B --no-patch $(git log --pretty=format:"%h" | fzf --preview "git show --format=%B --no-patch {} | bat --style=numbers --color=always --line-range :500 -p") | pbcopy
}
