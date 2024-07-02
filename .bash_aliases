export PATH=$PATH:/Users/rosslarner/bin
alias d='ssh dev.quizlet.com'
alias enums='yarn hh generate-enums-from-schema'
alias f='yarn test:hhvm'
alias h='yarn test:hhvm'
alias j='yarn test:jsw'
alias links='yarn dev:links'
alias m='mysql -h 127.0.0.1 -uuser -ppassw0rd'
alias models='yarn hh generate-models-from-schema'
alias p='ping www.yahoo.com'
alias schema_patch='yarn hh batch ApplySchemaPatch --mysql'

# Git shortcuts
# requires .gitconfig to have:
# recent-branches="for-each-ref --sort=-committerdate --count=10 --format='%(refname:short)' refs/heads/"
recent() { PS3='select branch: '; select b in `git recent-branches $*` ; do echo \"switching to $b\"; git co $b; exit; done; };
