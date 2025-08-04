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


### ruby gems update with bundler #####
function gem_update() {
  GREEN='\033[1;32m'
  BLUE='\033[1;34m'
  RESET='\033[0m'
  RED='\033[1;31m'

  echo "Pulling latest changes from Git..."
  git_output=$(git pull)

  if echo "$git_output" | grep -q "Already up to date."; then
    printf "${BLUE}=======> ${GREEN} Running bundle update ...................${RESET}\n"
    update_output=$(bundle update)

    if [ $? -eq 0 ]; then
      echo "Bundle update completed successfully."
    else
      printf "${RED}Error: Bundle update failed.${RESET}\n"
      return 1
    fi

    if ! git diff --quiet --exit-code Gemfile.lock; then
      echo "Running RuboCop..."
      rubocop -A

      echo "Committing changes..."
      git add Gemfile.lock
      commit_message=$(echo "$update_output" | grep -E '^Bundle complete!' | tail -1)
      git commit -m "Update gems: ${commit_message:-bundle update changes}"

      echo "Pushing changes to Git repository..."
      git push
    else
      echo "No changes to commit. Exiting."
    fi
  else
    printf "${RED}Error: Git repo is not up to date. Please pull and resolve manually.\n${RESET}"
    echo "$git_output"
    return 1
  fi
}

