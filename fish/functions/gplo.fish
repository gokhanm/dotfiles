function gplo --wraps='git pull origin (git rev-parse --abbrev-ref HEAD)' --description 'alias gplo=git pull origin (git rev-parse --abbrev-ref HEAD)'
  git pull origin (git rev-parse --abbrev-ref HEAD) $argv;
end
