# Enable colors and change prompt:

autoload -U colors && colors

conda_env()
{
    echo "$CONDA_PREFIX" | rev | cut -d"/" -f 1 | rev
}

setopt PROMPT_SUBST

PS1='%B %F{#B48EAD}$(conda_env)%f %F{#88C0D0}%n%f %F{#5E81AC}%~%f  %b'
PS2='%B %F{#B48EAD} >  %f%b'

# Color stuff

LESS='-R --use-color -Dd+r$Du+b'
eval $(dircolors ~/.config/zsh/dir_colors)

# Shared history in cache directory:
HISTSIZE=10000
SAVEHIST=10000
export HISTFILE=~/.cache/zsh/zhist
setopt SHARE_HISTORY
unsetopt no_share_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# alt dot
bindkey "^[." insert-last-word
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Load aliases and shortcuts if existent.

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Path sync

PATH="$PATH:$HOME/.local/share/"

# Conda include

# export PATH="/home/gala/.local/share/conda/bin:$PATH"  # commented out by conda initialize

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

__conda_setup="$('/home/gala/.local/share/conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/gala/.local/share/conda/etc/profile.d/conda.sh" ]; then
        . "/home/gala/.local/share/conda/etc/profile.d/conda.sh"
    else
        export PATH="/home/gala/.local/share/conda/bin:$PATH"
    fi
fi
unset __conda_setup

# <<< conda initialize <<<

# Load zsh-syntax-highlighting; should be last.

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=[fg=magenta, bg=white] #not working, look@later
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# bindkey '\t' autosuggest-accept

ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg="#D08770"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg="#D08770"
ZSH_HIGHLIGHT_STYLES[arg0]=fg=magenta
