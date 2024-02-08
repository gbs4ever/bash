update_node(){
   echo "Linux package node  is being installed .............. "
  nvm install node
  echo "   Double checking node version .... "
  node -v
}

upgrade (){
  echo "Linux package are being updated .............. "
  sudo apt update && sudo apt upgrade -y
  echo "Updater closing ............"
}

function gemupdate(){
  echo "updating gems  "
  echo "running bundle update ......"
  bundle update
  echo "Bundle closing ............"
  rubocop -A
  git add Gemfile.lock  && git commit -m "bundle updated " && git push 
}