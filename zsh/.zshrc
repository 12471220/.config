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
export JAVA_HOME=$ENV_HOME/jdk1.8.0_431
export GOPATH=$ENV_HOME/gopath
export GO_HOME=$ENV_HOME/go
export NODE_HOME=$ENV_HOME/node-v18.20.4
#export NODE_HOME=$ENV_HOME/node-v16.20.2
export SCRIPT_DIR=$HOME/Documents/scripts
#export MAVEN_HOME=$ENV_HOME/apache-maven-3.9.7
export SSLKEYLOGFILE=$HOME/.config/sslogdir/sslog.log

export PATH="$HOME/.local/bin:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$SCRIPT_DIR:$PATH:$PATH"
export PATH="$NODE_HOME/bin:$PATH"
export PATH="$GO_HOME/bin:$PATH"
export PATH="$GOPATH:$PATH"
#export PATH="$MAVEN_HOME/bin:$PATH"

#+----------------------+
#|        alias         |
#+----------------------+
alias nf="neofetch"
alias ra="joshuto"
alias nv="nvim"
alias fm="thunar"
alias lg="lazygit"
alias fl="figlet"
alias code="cursor"



# Initialize modules.
source ${ZIM_HOME}/myinit/proxy_set.zsh
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

