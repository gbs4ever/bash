function touchp() {
  mkdir -p $(dirname $1) && touch "$1"
}


function run_within_dir(){
  dir_pwd=$(pwd)
  cd $1 && $2
  cd "$dir_pwd"
}
function update_current(){
    update_bash
    for file in ~/bash/.*.sh
    do source $file
    done
}

function update_bash(){
  dir_pwd=$(pwd)
  cd ~/bash && git pull
  cd "$dir_pwd"
}
# All the dig info
function digga() {
  dig +nocmd "$1" any +multiline +noall +answer
}

# git functions
# most pulled from https://github.com/ignu/dotfiles

function gc() {
  git commit -v -a -m "$*"
}

function gd() {
  git difftool $1 -t Kaleidoscope -y
}

# this caused strange terminal input glitches when written as an alias
function gcb() {
  git checkout $(git branch --sort=-committerdate --format="%(refname:short)" | fzf)
}

function gbt() {
  git checkout -b $1 --track origin/$1
}

mk() {
	mkdir $1 && cd $1
}

gclone() {
	git clone "$1" && cd "$(basename "$1" .git)"
}
load(){
#!/bin/bash
echo rails server loads
echo please enter a cmd "(ps/local)"
read VAR
if [[ $VAR == "ps" ]];
then 
echo restating postgress server
sudo service postgresql restart
elif [[ $VAr == "local" ]];
then
echo start local heroku server
heroku local web
else
heroku run bash  
fi
exit


}

list_shortcuts(){
echo "gclone"
echo "mk"
echo "load"
echo "linuxfiles"
echo "linuxdev"
}

