source $DOTFILES/aliases/aliases

setopt AUTO_CD
setopt CORRECT

setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY

#prompt
autoload -U promptinit; promptinit
prompt pure

#auto_suggest
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
bindkey "^y" autosuggest-execute

#syn_highlight
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

#zsh_vim
bindkey -v
bindkey -M viins "^?" backward-delete-char
bindkey -M viins "jj" vi-cmd-mode

source "$ZDOTDIR/plugins/cursor_mode"

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
    bindkey -M $km -- '-' vi-up-line-or-history
    for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
        bindkey -M $km $c select-quoted
    done
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $km $c select-bracketed
    done
done


