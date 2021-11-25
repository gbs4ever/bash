alias clean="git ls-files --others -m --exclude-standard| xargs -r rubocop"
alias glo='git log --graph --pretty=format:"%Cred%h%Creset - %s %Cgreen(%cr)%Creset" --abbrev-commit --date=relative'
alias gp="g push origin HEAD"
 function gitcommit(){
    git commit -m $1
 }

function cltest(){
  echo "To run rubocop with auto correct type -A or just hit enter " 
  read VAR
  if [[ $VAR == "-A" ]];
  then
  echo "auto correcting"
  clean -A
  else
  echo "rubcopout out put"
  clean
  fi
  echo "Now running rspec test ....."
rspec 

}  

