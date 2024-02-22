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

# function gemupdate(){
#   echo "updating gems  "
#   echo "running bundle update ......"
#   bundle update
#   echo "Bundle closing ............"
#   rubocop -A
#   git add Gemfile.lock  && git commit -m "bundle updated " && git push 
# }
function gemupdate() {
  echo "Updating gems >>>"
  echo "running bundle update ........"
  update_output=$(bundle update)
  if [ $? -eq 0 ]; then
    echo "Bundle update completed successfully."
  else
    echo "Error: Bundle update failed."
    return 1
  fi


  if ! git diff --quiet --exit-code Gemfile.lock; then
    # Run RuboCop
    echo "Running RuboCop..."
    rubocop -A
    # Commit changes to Gemfile.lock with update output as part of the commit message
    echo "Committing changes..."
    git add Gemfile.lock
    git commit -m "Update gems: $update_output"
  
    # Push changes to Git repository
    echo "Pushing changes to Git repository..."
    git push
  else
    echo "No changes to commit, git exit "
  fi
  
}
