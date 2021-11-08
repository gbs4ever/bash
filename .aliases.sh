alias vpn="globalprotect"
alias please="sudo "
alias remove="rm -rf "
alias linuxdev="cd ~/dev"
alias linuxfiles="ls ~/dev"
alias update-bash="cd ~/bash && git pull"
alias gh='history|grep
alias cg='cd `git rev-parse --show-toplevel`'
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
