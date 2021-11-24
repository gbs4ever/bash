alias clean="git ls-files -m| xargs -r rubocop"
alias glo='git log --graph --pretty=format:"%Cred%h%Creset - %s %Cgreen(%cr)%Creset" --abbrev-commit --date=relative'
alias gp="g push origin HEAD"


function cltest(){
  echo "run rubocop then rspec....."
clean && rspec

}  
