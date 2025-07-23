function gbn --wraps='git branch && git checkout' --description 'alias gbn=git branch && git checkout'
  set -l new_branch_name $argv[1] # Get the first argument as the new branch name

  git branch $argv

  if test $status -eq 0
    git checkout $new_branch_name
  else
    echo "Error: Failed to create branch '$new_branch_name'."
  end
end
