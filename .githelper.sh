alias clean="git ls-files --others -m --exclude-standard| xargs -r rubocop"
alias glo='git log --graph --pretty=format:"%Cred%h%Creset - %s %Cgreen(%cr)%Creset" --abbrev-commit --date=relative'
alias gp="g push origin HEAD"


function cltest(){
  echo "to run rubocop type -A" 
  read VAR
  if [[ $VAR == "-A" ]];
  then
  clean -A
  else
  clean
  fi
  echo "no running rspec then rspec....."
rspec 
exit
}  

