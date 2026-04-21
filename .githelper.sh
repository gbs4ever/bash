alias clean="git ls-files --others -m --exclude-standard| xargs -r rubocop"
alias glo='git log --graph --pretty=format:"%Cred%h%Creset - %s %Cgreen(%cr)%Creset" --abbrev-commit --date=relative'
alias gp="g push origin HEAD"
function gc() {
  git commit -v -a -m "$*"
}
alias ghistory='history|grep'
alias cg='cd `git rev-parse --show-toplevel`'
function gd() {
  git difftool $1 -t Kaleidoscope -y
}
function sync_fork() {
  logger "SYNCING FORK......"
  git fetch upstream && git merge upstream/master && git push
}
# this caused strange terminal input glitches when written as an alias
function gcb() {
  git checkout $(git branch --sort=-committerdate --format="%(refname:short)" | fzf)
}
function ga() {
  git add "$*"
}
function gbt() {
  git checkout -b $1 --track origin/$1
}

#git config --global alias.diffprev 'diff HEAD^'

function gitsyncfork() {
  git pull upstream master && git push 
}
gclone() {
	git clone "$1" && cd "$(basename "$1" .git)"
}

import_git_issues() {
mkdir -p issues
 logger "SYNCING GITHUB ISSUES......"
mkdir -p issues

for i in $(gh issue list --state open --json number --jq '.[].number'); do
  file="issues/issue-$i.md"
  tmp="issues/.issue-$i.tmp"

  gh issue view $i --json number,title,body \
  --jq '"# Issue \(.number): " + .title + "\n\n" + .body' \
  > "$tmp"

  if [ ! -f "$file" ] || ! cmp -s "$file" "$tmp"; then
    mv "$tmp" "$file"
    echo "Updated $file"
  else
    rm "$tmp"
    echo "No change $file"
  fi
done
}