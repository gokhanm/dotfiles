function gc --wraps='git add . && git commit -m <message>' --description 'alias gc="git add . && git commit -m <message>"'

  if test -z "$argv"
    echo "Usage: gc \"<commit message>\""
    echo "  Example: gc \"feat: Implement new feature X\""
    return 1 
  end

  echo "Adding all new and modified files (git add .)..."
  git add .

  echo "Committing changes with message: \"$argv\""
  git commit -m "$argv"

end
