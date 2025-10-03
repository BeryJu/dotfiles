set -gx KUBE_EDITOR "code --wait"
set -gx VISUAL "code --wait"
set -gx EDITOR "code --wait"
set -g -x fish_greeting ''
set --export FZF_DEFAULT_OPTS '--cycle --layout=reverse --border --height=40% --preview-window=wrap --preview "bat --color=always --style=numbers --line-range=:500 {}"'

export LC_ALL=en_US.UTF-8

eval (starship init fish)
eval (kubectl completion fish)

# Aliases
alias readlink=greadlink

alias cat="bat"
alias vl="vault login -path=authentik/ -method=oidc"
# Docker
alias dc="docker compose"
alias dup="docker compose up -d"
alias nr="npm run"
alias kgwp="watch kubectl get pods --all-namespaces -o wide"
# utilities
alias tf="terraform"
alias xpy="docker run -it --rm -v {$PWD}:/data -w /data python:3.7 /bin/bash"
alias sentry-cli-b='docker run -it --rm -e SENTRY_URL=https://sentry.beryju.org/ -v {$PWD}:/work -v ~/.sentryclirc:/root/.sentryclirc getsentry/sentry-cli'
alias keytool="docker run --rm -v {$PWD}:{$PWD} openjdk keytool"
alias az="docker run -it --rm -v {$HOME}/.ssh:/root/.ssh -v {$HOME}/.azure:/root/.azure -v {$HOME}/.kube:/root/.kube mcr.microsoft.com/azure-cli az"
# Ansible
alias gi="ansible-galaxy install -p ./roles -r requirements.yml --verbose --force"
alias gix="find . -type d -maxdepth 1 -name 'env_*' -exec sh -c 'cd {} && echo {} && ansible-galaxy install -p ./roles -r requirements.yml --force >/dev/null' \;"
alias ap="ansible-playbook --diff"
alias apj="ap --ssh-common-args='-o ProxyCommand=\"ssh -W %h:%p -q vl-warp.haufe-ep.de\"'"
alias al="ansible-lint --exclude=roles/ site.yml"
alias mp="multipass"
alias ff="flux reconcile source git flux-system"

export HOMEBREW_NO_AUTO_UPDATE=1
export PIP_REQUIRE_VIRTUALENV=1
export PIPENV_IGNORE_VIRTUALENVS=1
export ANSIBLE_RETRY_FILES_ENABLED=0
export EDITOR=nano
export VAULT_ADDR="https://vault.beryju.io"

set -x GOPATH $HOME/.local/share/go

fish_add_path "/Users/jens/.local/bin"
fish_add_path "/Users/jens/.local/share/go/bin"
fish_add_path "/Users/jens/dev/bin"
fish_add_path "/Users/jens/dev/authentik-cli/bin/cli"

fish_add_path "$(brew --prefix)/bin"
fish_add_path "/opt/homebrew/opt/make/libexec/gnubin"
fish_add_path "/opt/homebrew/opt/node@22/bin"
fish_add_path "/opt/homebrew/opt/python@3.11/bin"
fish_add_path "/opt/homebrew/opt/python@3.12/bin"
fish_add_path "/opt/homebrew/opt/openssl@3/bin"
fish_add_path "/opt/homebrew/opt/ruby/bin"
fish_add_path "/opt/homebrew/opt/krb5/bin"
fish_add_path "/opt/homebrew/opt/krb5/sbin"
fish_add_path "/opt/homebrew/opt/gnu-sed/libexec/gnubin"
fish_add_path "/opt/homebrew/opt/libxml2/bin"

set -gx LDFLAGS "-L/opt/homebrew/opt/libxml2/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/libxml2/include"
set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/libxml2/lib/pkgconfig"

alias headscale="kubectl --context=beryjuio-oci exec -n headscale  -it sts/headscale -- headscale"
alias gpr="GH_FORCE_TTY=100% gh pr list | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 4 | awk '{print \$1}' | xargs gh pr checkout"
alias gpa="GH_FORCE_TTY=100% gh pr list | fzf -m --ansi --preview 'GH_FORCE_TTY=100% gh pr checks {1}' --header-lines 4 | awk '{print \$1}' | xargs -n1 gh pr review --approve"
alias gpm="GH_FORCE_TTY=100% gh pr list | fzf -m --ansi --preview 'GH_FORCE_TTY=100% gh pr checks {1}' --header-lines 4 | awk '{print \$1}' | xargs -n1 gh pr merge -s -d"
alias es-sync="k annotate es --all force-sync=$(date +%s) --overwrite"
alias cf="cloudflared tunnel run authentik-dev"

# Kubectl krew
set -q KREW_ROOT; and set -gx PATH $PATH $KREW_ROOT/.krew/bin; or set -gx PATH $PATH $HOME/.krew/bin
