export PATH=$PATH:/Users/rosslarner/bin
alias d='ssh dev.quizlet.com'
alias enums='yarn hh generate-enums-from-schema'
alias f='yarn test:hhvm'
alias h='yarn test:hhvm'
alias j='yarn test:jsw'
alias links='yarn dev:links'
alias dbsync='yarn hh dbsync'
alias m='mysql -h 127.0.0.1 -uuser -ppassw0rd'
alias models='yarn hh generate-models-from-schema'
alias p='ping www.yahoo.com'
alias schema_patch='yarn hh batch ApplySchemaPatch --mysql'
alias gulp='yarn gulp build:config'
alias timeout='gp timeout set 84600s'
alias restart_memcached='echo "If you’d like to clear data from memcached, open up the Data Services tab in Terminal, Ctrl-C the exisitng --follow command, and execute this command:"; echo "docker compose --file tooling/devenvs/services/docker-compose.yml restart memcached"'

# Git shortcuts
# requires .gitconfig to have:
# recent-branches="for-each-ref --sort=-committerdate --count=10 --format='%(refname:short)' refs/heads/"
recent() { PS3='select branch: '; select b in `git recent-branches $*` ; do echo \"switching to $b\"; git co $b; exit; done; };
run_until_failure() {
  local command_to_run="$@"
  local attempt_count=1

  echo "Running command until failure: '$command_to_run'"

  while eval "$command_to_run"; do
    echo "Command succeeded on attempt $attempt_count."
    ((attempt_count++))
    # Optional: Add a delay between successful runs
    # sleep 1
  done

  echo "Command failed on attempt $attempt_count with exit code: $?."
}
