alias clean="git ls-files --others -m --exclude-standard| xargs -r rubocop"
alias glo='git log --graph --pretty=format:"%Cred%h%Creset - %s %Cgreen(%cr)%Creset" --abbrev-commit --date=relative'
alias gp="g push origin HEAD"
function gc() {
  git commit -v -a -m "$*"
}
alias gh='history|grep'
alias cg='cd `git rev-parse --show-toplevel`'
function gd() {
  git difftool $1 -t Kaleidoscope -y
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



