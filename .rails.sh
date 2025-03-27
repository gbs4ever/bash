alias test_migrate="RAILS_ENV=test rails db:migrate"
alias rt="bundle exec rails test"
alias bnd="bundle"

### ruby gems update with bundler #####
function gem_update() {
  echo "Updating gems >>>"
  logger "Running bundle update ........"
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
    git commit -m "Update gems: $(echo "$update_output" | grep -E '^Bundle complete!' | tail -1)"
  
    # Push changes to Git repository
     logger "Pushing changes to Git repository..."
    git push
  else
    echo "No changes to commit, git exit "
  fi
  
}