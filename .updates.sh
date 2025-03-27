update_node(){
   echo "Linux package node  is being installed .............. "
  nvm install node
  echo "   Double checking node version .... "
  node -v
}

upgrade_linux (){
  echo "Linux package are being updated .............. "
  sudo apt update && sudo apt upgrade -y
  echo "Updater closing ............"
}



