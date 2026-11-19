export PATH="$HOME/.local/bin:$PATH"


# FZF
export PATH="$HOME/.fzf/bin:$PATH"
source <("$HOME/.fzf/bin/fzf" --zsh)

# ZSH COMPLETION
autoload -Uz compinit
compinit

# DIRECTORY SHORTCUTS
hash -d 42sp=~/42sp
hash -d evals=~/evaluations

alias 42="cd ~42sp"
alias evals="cd ~evals"
alias doc="cd ~/Documents"
alias dow="cd ~/Downloads"

# ZSH
alias reload="source ~/.zshrc"
alias zshconfig="code ~/.zshrc"
alias zshenv="code ~/.zshenv"
alias zshplugins="ls -lahF ~/.zsh/plugins/"
alias starshipconfig="code ~/.config/starship.toml"
alias c="clear"

# LS
alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -lahF'
alias lls='ls -lahFtr'
alias la='ls -A'
alias lc='ls -CF'

# FILE MANAGEMENT
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

# PYTHON
alias cobra="mypy . --strict ; rm -rf .mypy_cache ; flake8"


# GIT SHORTCUTS
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpo='git push origin'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias glo='git log --pretty="oneline"'
alias glol='git log --graph --oneline --decorate'

# AUTOMATIC Commands
function chpwd() {
    emulate -L zsh
    ls
}

# compile .c file with flags and create the .out with the same name
ccw() {
    cc -Wall -Werror -Wextra "$@" -o "${1%.c}"
}

# the same thing as the above but runs the binary
ccwr() {
    local name="${1%.c}"
    shift
    cc -Wall -Werror -Wextra "${name}.c" -o "$name" && ./"$name" "$@"
}





# make fzf open the file directly
# code -n $file (-n force new window)
fzf() {
    local FILE
    FILE=$(command fzf "$@")

    if [[ -n "$FILE" ]]; then
        code -n "$FILE"
    fi
}

# PLUGINS

# Fish-like autosuggestions
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting (keep last)
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# SYNTAX HIGHLIGHTING
ZSH_HIGHLIGHT_STYLES[command]='fg=#9d7cd8,bold'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#d65d6e,bold' #suggestion
ZSH_HIGHLIGHT_STYLES[alias]='fg=#9d7cd8'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#9d7cd8'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#9d7cd8,bold'

# STARSHIP PROMPT
eval "$(starship init zsh)"
