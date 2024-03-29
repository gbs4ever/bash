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





mk() {
	mkdir $1 && cd $1
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
}

list_shortcuts(){
echo "gclone"
echo "mk"
echo "load"
echo "linuxfiles"
echo "linuxdev"
}
# alias clean="rubocop"
# function cltest(){
#   echo "To run rubocop with auto correct type -A or just hit enter " 
#   read VAR
#   if [[ $VAR == "-A" ]];
#   then
#   echo "auto correcting"
#   clean -A
#   else
#   echo "rubcopout out put"
#   clean
#   fi
#   echo "Now running rspec test ....."
# rspec

# }  
