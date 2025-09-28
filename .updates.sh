#!/bin/bash
#==============================
# Global colors
#==============================
global_variables() {
  BLUE='\033[1;34m'
  GREEN='\033[1;32m'
  RED='\033[1;31m'
  RESET='\033[0m'
}

#==============================
# Install Node via NVM
#==============================
update_node() {
  echo "Installing Node.js via NVM..."
  nvm install node
  echo "Checking Node.js version..."
  node -v
}

#==============================
# Update Linux packages
#==============================
linux_update() {
  printf "${BLUE}=======> ${GREEN}Updating Linux packages...${RESET}\n"
  sudo apt update && sudo apt upgrade -y
  printf "${GREEN} <======> Linux packages updated successfully.${RESET}\n"
}

#==============================
# Update Ruby gems with Bundler
#==============================
gem_update() {
  echo "Pulling latest changes from Git..."
  git_output=$(git pull)

  if echo "$git_output" | grep -q "Already up to date."; then
    printf "${BLUE}=======> ${GREEN}Running bundle update...${RESET}\n"
    update_output=$(bundle update)

    if [ $? -eq 0 ]; then
      echo "Bundle update completed successfully."
    else
      printf "${RED}Error: Bundle update failed.${RESET}\n"
      return 1
    fi

    if ! git diff --quiet --exit-code Gemfile.lock; then
      echo "Running RuboCop to auto-correct style issues..."
      rubocop -A

      echo "Committing Gemfile.lock changes..."
      git add Gemfile.lock
      commit_message=$(echo "$update_output" | grep -E '^Bundle complete!' | tail -1)
      git commit -m "Update gems: ${commit_message:-bundle update changes}"

      echo "Pushing changes to Git repository..."
      git push
    else
      echo "No changes to commit. Exiting."
    fi
  else
    printf "${RED}Error: Git repo is not up to date. Please pull and resolve manually.${RESET}\n"
    echo "$git_output"
    return 1
  fi
}

#==============================
# Main execution
#==============================
global_variables

