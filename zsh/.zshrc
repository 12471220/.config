#+----------------------+
#|    shell history     |
#+----------------------+
HISTFILE=$HOME/.config/zsh/zsh_history
HISTSIZE=10000
SAVEHIST=1000000
setopt share_history
setopt histappend

# ZIM_HOME must be set before the sourcing loop
export ZIM_HOME=$HOME/.config/zsh

#+----------------------+
#|   init blacklist     |
#+----------------------+
# Files matching these names are skipped during sourcing.
init_blacklist=(
  sslkeylog_load.sh
  fcitx5.sh
  nvm_init.sh
)

#+----------------------+
#|  source init scripts |
#+----------------------+
# Scripts in init/ are sourced in glob (alphabetical) order:
#   00  - environment variables
#   10  - PATH additions
#   20  - aliases
#   25  - zimfw (must load before letter-prefixed plugin scripts)
#   a-z - application init scripts (bun, conda, man-page-color, proxy, zimplug)
for filepath in ${ZIM_HOME}/init/*.sh; do
  if [[ -f $filepath ]]; then
    local filename="${filepath##*/}"
    if [[ " ${init_blacklist[*]} " =~ " ${filename} " ]]; then
      continue
    fi
    source $filepath
  fi
done
