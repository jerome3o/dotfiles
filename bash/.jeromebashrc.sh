# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

[ -x /usr/bin/xkbcomp ] && xkbcomp $HOME/.xkbmap $DISPLAY 2> /dev/null

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

## Variables

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# Golang
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin

# ROCm
export PATH=$PATH:/opt/rocm/bin

# .local/bin
export PATH="$PATH:$HOME/.local/bin"

# Editor
export EDITOR=nvim

# # SSH agent
if [ -z ${SSH_AUTH_SOCK+x} ]; then
	export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi
if [ "$SSH_AUTH_SOCK" != ~/.ssh/ssh_auth_sock ]; then
	ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
fi


## Shell Options

# append to the history file, don't overwrite it
shopt -s histappend

# multiline commands added to history as oneliners
shopt -s cmdhist

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# if set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# extended globs
shopt -s extglob

# globs ignore case
shopt -s nocaseglob

# globs will consider hidden files too
shopt -s dotglob

# Automatically cd if a path is entered without a command
shopt -s autocd

# fix minor typos
shopt -s cdspell
shopt -s dirspell

# don't try autocomplete empty lines
shopt -s no_empty_cmd_completion


## Prompt

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    function prompt_callback {
      echo -n " [${HOSTNAME}]"
    }
    source $HOME/.bash-git-prompt/gitprompt.sh
fi


## Completions

source /usr/share/bash-completion/completions/git
__git_complete g __git_main

## Alias'

alias fd="fdfind"
alias q='(cd ~; ./.hotkeys_on.sh)'
alias jclone='curl -s https://api.github.com/users/jerome3o/repos?per_page=100 | jq ".[].name" | sed "s/\"\(.*\)\"/\1/g" | fzf | xargs -I{} git clone git@github.com:/jerome3o/{}'
alias gitcount='git ls-files | while read f; do git blame --line-porcelain $f | grep "^author "; done | sort -f | uniq -ic | sort -n'
alias h="cat <(compgen -acbk -A function) <(apropos -s 1 '') | sort | uniq | fzf"
alias n="nvim ~/.notes.md"
alias gc="g c"
alias kshell='kubectl run --rm -i --tty jerome-shell --image=ubuntu --restart=Never'
alias k='kubectl'

# fzf git tools
alias fco='g co $(g branch | fzf)'
alias ffx='git commit --fixup $(git log --pretty=format:"%h %s" | fzf | awk "{print \$1}")'

alias hpon='bluetoothctl connect 2C:BE:EB:11:36:8D'
alias hpoff='bluetoothctl disconnect 2C:BE:EB:11:36:8D'
alias s="cd ~/source"
alias fcd='cd $(find . -type d -print | fzf)'
alias kc="kubectx"
alias kns="kubens"
alias pbcopy='xclip -selection c'             # OSX script compatibility
alias pbpaste='xclip -selection clipboard -o' # OSX script compatibility
alias xc="xcape -e 'Shift_L=parenleft;Shift_R=parenright'"
alias dka="docker ps -q | xargs docker kill"
alias ll="ls -lah"
alias t="tmux"
alias nv="nvim"
alias g="git"
alias Q='setxkbmap'
alias hk='cd && ./.hotkeys_on.sh && cd -'
alias gs='git status'
alias hk='~/.hotkeys_on.sh'
# alias lenv='export $(cat .env | grep -v "^#" | xargs)'
alias serve="browser-sync start -s -f . --no-notify --host 0.0.0.0 --port 9000"
alias rs="rsync -rah --progress"
alias vvv="python3 -m venv venv"

## Functions

# alias vv=". venv/bin/activate"

lenv() {
  filename=${1:-.env}
  if [ -f $filename ]; then
    export $(cat $filename | grep -v "^#" | xargs)
    echo "Environment variables exported from $filename"
  else
    echo "File not found: $filename"
  fi
}

function vv() {
	if [ -f ./venv/bin/activate ]; then
		. ./venv/bin/activate
		return 0
	fi
	if [ -f ./.venv/bin/activate ]; then
		. ./.venv/bin/activate
		return 0
	fi
	return 1

}

function gg() {
	git grep $1 $(git rev-list --all)
}

venv (){
	d=$(date +"%D %T" | sed 's/[\/: -]/_/g')
	mkdir ~/tmp/$d
	pushd ~/tmp/$d > /dev/null
	python -m venv ./venv
	mkdir .vscode
	echo '{
		"python.defaultInterpreterPath": "${workspaceFolder}/venv/bin/python",
		"terminal.activateEnvironment": true
	}' > ./.vscode/settings.json
	echo '{
		"version": "0.2.0",
		"configurations": [
			{
				"name": "Python: Current File",
				"type": "python",
				"request": "launch",
				"program": "${file}",
				"console": "integratedTerminal"
			}
		]
	}' > ./.vscode/launch.json
}

# git log
function gl(){
	suffix=" -n $1"
	if [ -z $1 ]; then
		suffix=""
	fi
	git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' \
		--abbrev-commit $suffix
}

function gad(){
	git add .
}

# git ammend
function gam(){
	git commit --amend --no-edit;
}

# git push force
function gpf(){
	git push --force-with-lease
	git status
}

# git commit push
function gcp(){
	if [ -z "$1" ]; then
		echo Commit message required
		return
	fi
	gc "$*"
	git push
}

# git commit push force with lease
function gcpf(){
	if [ -z "$1" ]; then
		echo Commit message required
		return
	fi
	gc "$*"
	gpf
}

# git branch
function gb(){
	git checkout -b $1
	git push --set-upstream origin $1
	git status
}


## Function Helpers

# looks for ticket in the form AB-123456, more specifically [A-Z]{2}-[0-9]+
function getticket(){
	branch=$(git branch --show-current)
	ticket=$(echo $branch | sed -r 's/.*[^A-Z]([A-Z]+-[0-9]+).*/\1/')
	if [ $ticket == $branch ]; then
		echo none
	else
		echo $ticket
	fi
}

# uses getticket and generates a commit prefix like "AB-12345 - " or if no ticket is found "".
function getcommitprefix(){
	ticket=$(getticket)
	if [ "$ticket" != "none" ]; then
		echo "$ticket - "
	else
		echo ""
	fi
}

# changes directory to the root of the git repo
function gr(){
  cd $(git rev-parse --show-toplevel)
}

# Copies all files from ~/templates/$1 to current directory
function template(){
  if [ -z "$1" ]; then
    echo "Template name required"
    return
  fi
  cp -r ~/templates/$1/* .
}

## Tmux Entry

# if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ] && [ -z ${TERM_PROGRAM+x} ]; then
#     tmux >/dev/null 2>&1
# fi


# https://docs.dagster.io/deployment/guides/kubernetes/customizing-your-deployment#kubernetes-job-and-pod-ttl-management
dagsterclean() {
	kubectl get job | grep -e dagster-run -e dagster-step | awk 'match($4,/[0-9]+d/) {print $1}' | xargs kubectl delete job
	kubectl get pod | grep -e dagster-run -e dagster-step | awk 'match($3,/Completed/) {print $0}' | awk 'match($5,/[0-9]+d/) {print $1}' | xargs kubectl delete pod
}

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"

if command -v pyenv &>/dev/null; then
    eval "$(pyenv init --path)"
    eval "$(pyenv virtualenv-init -)"
fi


if command -v kubectl &>/dev/null; then
    source <(kubectl completion bash)

    # for alias k
    complete -o default -F __start_kubectl k
fi

# if ~/.env exists, load it
if [ -f ~/.env ]; then
		lenv ~/.env
fi
