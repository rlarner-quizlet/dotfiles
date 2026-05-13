export PATH=$PATH:/Users/rosslarner/bin
alias enums='phpctl batch generate-enums-from-schema'
alias f='pnpm test:php'
alias h='pnpm test:php'
alias j='pnpm test:jsw'
alias links='pnpm dev:links'
alias dbsync='phpctl batch dbsync'
alias m='mysql'
alias models='phpctl generate-enums-from-schema'
alias p='ping www.yahoo.com'
alias schema_patch='phpctl batch ApplySchemaPatch --mysql'
alias gulp='pnpm gulp build:config'
alias timeout='gp timeout set 84600s'
alias restart_memcached='echo "If you'd like to clear data from memcached, open up the Data Services tab in Terminal, Ctrl-C the exisitng --follow command, and execute this command:"; echo "docker compose --file tooling/devenvs/services/docker-compose.yml restart memcached"'
alias restart_renderer='npx pm2 restart all; npx pm2 logs dev-main-server'
alias clfd='sudo mkdir -p --mode=0755 /usr/share/keyrings && curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null && echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared jammy main' | sudo tee /etc/apt/sources.list.d/cloudflared.list && sudo apt-get update && sudo apt-get install cloudflared; cloudflared tunnel --url http://localhost:8080'
alias add_chatgpt_client='phpctl batch GenerateChatGPTClientIdAndSecret --exec'
alias expose_web='ngrok http --url=https://quizlet-ross-web.ngrok.app http://localhost:8080'
# Git shortcuts
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
