# FILE AUTOMATICALLY GENERATED FROM /home/sc/.config/zsh/.zimrc
# EDIT THE SOURCE FILE AND THEN RUN zimfw build. DO NOT DIRECTLY EDIT THIS FILE!

if [[ -e ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]] zimfw() { source "${HOME}/.config/zsh/zimfw.zsh" "${@}" }
fpath=("${HOME}/.config/zsh/modules/prompt-pwd/functions" "${HOME}/.config/zsh/modules/utility/functions" "${HOME}/.config/zsh/modules/git-info/functions" ${fpath})
autoload -Uz -- prompt-pwd mkcd mkpw coalesce git-action git-info
source "${HOME}/.config/zsh/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "${HOME}/.config/zsh/modules/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "${HOME}/.config/zsh/modules/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
source "${HOME}/.config/zsh/modules/zsh-autopair/zsh-autopair.plugin.zsh"
source "${HOME}/.config/zsh/modules/zsh-vi-mode/zsh-vi-mode.zsh"
source "${HOME}/.config/zsh/modules/completion/init.zsh"
source "${HOME}/.config/zsh/modules/gitster/gitster.zsh-theme"
source "${HOME}/.config/zsh/modules/utility/init.zsh"
