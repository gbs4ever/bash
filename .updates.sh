update_node(){
   echo "Linux package node  is being installed .............. "
  nvm install node
  node-v
}

upgrade (){
  echo "Linux package are being updated .............. "
  sudo apt update && sudo apt upgrade -y
  echo "Updater closing ............"
}