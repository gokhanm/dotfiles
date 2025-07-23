function gpo --wraps='git pull origin (git rev-parse --abbrev-ref HEAD)'
    --description 'alias gpo=git pull origin (git rev-parse --abbrev-ref HEAD)'
  git pull origin (git rev-parse --abbrev-ref HEAD) $argv;
end
