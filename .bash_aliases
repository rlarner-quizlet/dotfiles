alias p='ping www.yahoo.com'
export PATH=$PATH:/Users/rosslarner/bin
alias d='ssh dev.quizlet.com'
alias f='yarn test:hhvm'
alias j='yarn test:js'

# Git shortcuts
# requires .gitconfig to have:
# recent-branches="for-each-ref --sort=-committerdate --count=10 --format='%(refname:short)' refs/heads/"
recent() { PS3='select branch: '; select b in `git recent-branches $*` ; do echo \"switching to $b\"; git co $b; exit; done; };
