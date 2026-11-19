# PATH
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


# ZSH SHORTCUTS
alias reload="source ~/.zshrc"
alias zshconfig="code ~/.zshrc"
alias zshenv="code ~/.zshenv"
alias zshplugins="ls -lahF ~/.zsh/plugins/"
alias starshipconfig="code ~/.config/starship.toml"
alias c="clear"


# LS SHORTCUTS
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


# AUTOMATIC DIRECTORY LISTING
function chpwd() {
    emulate -L zsh
    ls
}


# C COMPILATION
# Compile a .c file with the required flags
ccw() {
    cc -Wall -Werror -Wextra "$@" -o "${1%.c}"
}

# Compile and run a .c file
ccwr() {
    local name="${1%.c}"
    shift
    cc -Wall -Werror -Wextra "${name}.c" -o "$name" && ./"$name" "$@"
}


# FZF FILE OPENER
# Open selected files in VS Code
fzf() {
    local FILE
    FILE=$(command fzf "$@")

    if [[ -n "$FILE" ]]; then
        code -n "$FILE"
    fi
}


# DOTFILES BACKUP
# Copy, commit and push .zshrc changes
updatezshdotfile() {
    local DOTFILES="$HOME/42sp/dotfiles/42-dotfiles"

    cp "$HOME/.zshrc" "$DOTFILES/.zshrc" || return 1

    cd "$DOTFILES" || return 1

    git add .zshrc
    git commit -m "Update zsh configuration"
    git push

    cd ~42sp
}


# PLUGINS

# Fish-like autosuggestions
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# SYNTAX HIGHLIGHTING STYLES
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#565f89'
ZSH_HIGHLIGHT_STYLES[command]='fg=#9d7cd8,bold'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#d65d6e,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#9d7cd8'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#9d7cd8'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#9d7cd8,bold'


# STARSHIP PROMPT
eval "$(starship init zsh)"
