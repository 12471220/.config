#+----------------------+
#|     export env       |
#+----------------------+
HISTFILE=$HOME/.config/zsh/zsh_history
HISTSIZE=10000
SAVEHIST=1000000
setopt share_history
setopt histappend
export ENV_HOME=$HOME/.local/env
export ZIM_HOME=$HOME/.config/zsh
export JAVA_HOME=$ENV_HOME/jdk-21.0.4
export GOPATH=$ENV_HOME/gopath
export GO_HOME=$ENV_HOME/go
export NODE_HOME=$ENV_HOME/node-v18.20.4
#export NODE_HOME=$ENV_HOME/node-v16.20.2
export SCRIPT_DIR=$HOME/Documents/scripts
#export MAVEN_HOME=$ENV_HOME/apache-maven-3.9.7
export SSLKEYLOGFILE=$HOME/.config/sslog.log

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$JAVA_HOME/bin"
export PATH="$PATH:$SCRIPT_DIR"
export PATH="$PATH:$NODE_HOME/bin"
export PATH="$PATH:$GO_HOME/bin"
export PATH="$PATH:$GOPATH"
#export PATH="$PATH:$MAVEN_HOME/bin"

#+----------------------+
#|        alias         |
#+----------------------+
alias nf="neofetch"
alias ra="joshuto"
alias nv="nvim"
alias fm="thunar"
alias lg="lazygit"
alias fl="figlet"



# Initialize modules.
source ${ZIM_HOME}/proxy_set.zsh
source ${ZIM_HOME}/init.zsh
#source $ENV_HOME/pyenv/bin/activate



#+----------------------+
#|       plugins        |
#+----------------------+
zstyle ':zim:zmodule' use 'degit'
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

