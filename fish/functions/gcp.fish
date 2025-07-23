function gcp --wraps='git add . && git commit -m <message> && git push origin <current_branch>' --description 'alias gcp="git add . && git commit -m <message> && git push origin <current_branch>"'
  # This function provides a shorthand to add all new/modified files,
  # commit changes with a message, and then push those changes
  # to the current branch on the 'origin' remote.
  #
  # Arguments:
  #   <message>: The commit message for your changes. (Required)
  #
  # Usage:
  #   gcp "feat: Add new user authentication"
  #   gcp "fix: Resolve critical bug in login flow"

  # Check if a commit message is provided
  if test -z "$argv"
    echo "Usage: gcp \"<commit message>\""
    echo "  Example: gcp \"feat: Implement new feature X\""
    return 1 # Return with error code
  end

  # Get the current branch name
  # 'git rev-parse --abbrev-ref HEAD' returns the name of the current branch.
  set -l current_branch (git rev-parse --abbrev-ref HEAD)

  # Check if we are on a branch (not detached HEAD)
  if test "$current_branch" = "HEAD"
    echo "Error: You are in a detached HEAD state. Cannot determine branch to push to."
    echo "Please checkout a branch first (e.g., 'git checkout main')."
    return 1
  end

  # Add all new and modified files to the staging area
  echo "Adding all new and modified files (git add .)..."
  git add .

  # Execute git commit with the provided message
  echo "Committing changes with message: \"$argv\""
  git commit -m "$argv"

  # Check if the commit was successful before pushing
  if test $status -eq 0
    # Push to the current branch on the 'origin' remote
    echo "Pushing changes to origin/$current_branch..."
    git push origin "$current_branch"
  else
    echo "Error: Git commit failed. Please resolve any issues and try again."
  end
end
