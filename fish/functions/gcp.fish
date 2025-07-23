function gcp --wraps='git add . && git commit -m <message> && git push origin <current_branch>' --description 'alias gcp="git add . && git commit -m <message> && git push origin <current_branch>"'

  if test -z "$argv"
    echo "Usage: gcp \"<commit message>\""
    echo "  Example: gcp \"feat: Implement new feature X\""
    return 1 
  end

  set -l current_branch (git rev-parse --abbrev-ref HEAD)

  if test "$current_branch" = "HEAD"
    echo "Error: You are in a detached HEAD state. Cannot determine branch to push to."
    echo "Please checkout a branch first (e.g., 'git checkout main')."
    return 1
  end

  echo "Adding all new and modified files (git add .)..."
  git add .

  echo "Committing changes with message: \"$argv\""
  git commit -m "$argv"

  if test $status -eq 0
    echo "Pushing changes to origin/$current_branch..."
    git push origin "$current_branch"
  else
    echo "Error: Git commit failed. Please resolve any issues and try again."
  end
end
