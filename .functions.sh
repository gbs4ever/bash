#!/bin/bash
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
  GREEN='\033[1;32m'
  BLUE='\033[1;34m'
  RESET='\033[0m'
  RED='\033[1;31m'

  dir_pwd=$(pwd)
  cd ~/bash && git pull || { printf "${RED}Error: git pull failed. Aborting.${RESET}\n"; cd "$dir_pwd"; exit 1; }
  cd "$dir_pwd"
  printf "${BLUE}=======> ${GREEN} Updating bash .dot scripts...........${RESET}\n"



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


function load() {
    echo "Please enter a command (ps/hssh):"
    read VAR

    if [[ $VAR == "ps" ]]; then 
        logger "Restarting PostgreSQL server..."
        sudo service postgresql restart
    elif [[ $VAR == "hssh" ]]; then
        logger "SSH into Heroku server........"
        logger "============>"
        heroku run bash
    else
        heroku run rails c
    fi
}

list_shortcuts(){
echo "gclone"
echo "mk"
echo "load"
echo "linuxfiles"
echo "linuxdev"
}
rmv () {
if [ -e "$1" ]; then
    read -r -p "Are you sure you want to remove '$1'? Type 'yes' to confirm: " response
    if [[ "$response" == "yes" ]]; then
      if [ -d "$1" ]; then
        /bin/rm -r "$1"
        echo "Directory '$1' has been removed."
      else
        /bin/rm "$1"
        echo "File '$1' has been removed."
      fi
    else
      echo "Operation canceled. '$1' was not removed."
    fi
  else
    echo "Please provide a file or directory to remove , '$1' does not exist."
  fi
}




# confirm "$1"
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
