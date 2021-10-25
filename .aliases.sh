alias vpn="globalprotect"
alias please="sudo "
alias remove="rm -rf "

mk() {
	mkdir $1 && cd $1
}

gclone() {
	git clone "$1" && cd "$(basename "$1" .git)"
}


list_shortcuts(){
echo "gclone"
echo "mk"
}