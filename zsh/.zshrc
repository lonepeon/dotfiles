setopt EXTENDED_HISTORY
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

fpath=("${HOME}/.zsh/functions" "${fpath[@]}");
for f in ~/.zsh/functions/*; do autoload -Uz ${f##*/}; done

[ -z "$TMUX" ] && tmux-session;

bindkey -e
autoload -U edit-command-line;
zle -N edit-command-line;
bindkey '^x^e' edit-command-line # Edit current line with C-x+C-e
bindkey '^[[1;9D' backward-word # Alt-Left
bindkey '^[[1;9C' forward-word # Alt-Right
bindkey '^[[1;3D' backward-word # Alt-Left
bindkey '^[[1;3C' forward-word # Alt-Right
bindkey '^[[3~' delete-char # Delete
bindkey '^[[Z' reverse-menu-complete # Ctrl-r
bindkey '^[[A' up-line-or-search # Arrow up
bindkey '^[[B' down-line-or-search # Arrow down

setopt PROMPT_SUBST
export PROMPT='%F{235}%B%c%b%f %(?.%F{24}❯%f.%F{198}❯%f) '

source ${HOME}/.zsh/aliases;
[[ -r ${HOME}/.asdf/asdf.sh ]] && source ${HOME}/.asdf/asdf.sh;
[[ -r ${HOME}/.zshrc.local ]] && source ${HOME}/.zshrc.local;
true
