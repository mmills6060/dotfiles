# Lazy load NVM to improve startup time
export NVM_DIR="$HOME/.nvm"
nvm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    nvm "$@"
}
node() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    node "$@"
}
npm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    npm "$@"
}
npx() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    npx "$@"
}


# GitHub SSH Key
export GITHUB_SSH_KEY='/Users/michael.mills/.ssh/id_rsa'

# iTerm2 Shell Integration (optional, can comment out if not needed)
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Aliases (add any custom aliases here)
alias ll='ls -la'
alias ..='cd ..'

# Prompt customizations (optional, customize to your liking)
export PS1="%n@%m:%~$ "


f() {
  local file=$(fzf)
  if [[ -n "$file" ]]; then
    nvim "$file"
  fi
}

fp() {
  # Define an array of directories you want to search within

  # Use find to search in all the specified directories and pipe it to fzf
  local file=$(find ~/Documents ~/.config -type f | fzf)

  # Open the selected file in nvim if a file was selected
  if [[ -n "$file" ]]; then
    nvim "$file"
  fi
}


fd() {
  # Use `find` to locate directories within the specified base directory
  local dir=$(find ~/Documents ~/Projects -type d | fzf)

  # If a directory is selected, change to that directory
  if [[ -n "$dir" ]]; then
    cd "$dir" || return
    # Optionally, print the new directory path
    echo "Changed directory to: $dir"
  fi
}


# Define functions for each command
fp_command() { zle reset-prompt; fp }
fd_command() { zle reset-prompt; fd }

# Make the functions available to ZLE
zle -N fp_command
zle -N fd_command

# Bind Control + g to run `fp_command`
bindkey "^G" fp_command

# Bind Control + f to run `fp_command`
bindkey "^F" fp_command

# Bind Control + t to run `fd_command`
bindkey "^T" fd_command

# Bind Ctrl+K to search backward through command history
bindkey '^K' history-search-backward

# Bind Ctrl+J to search forward through command history
bindkey '^J' history-search-forward


# Source additional scripts (if any)
# source ~/.additional_script.sh

# Load plugins or other configurations
# Uncomment and add plugins as needed for zsh frameworks (e.g., oh-my-zsh)
# plugins=(git zsh-autosuggestions)
# source $ZSH/oh-my-zsh.sh

# Fast git prompt (optional)
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b'
setopt prompt_subst
PS1='%n@%m:%~${vcs_info_msg_0_} %(!.#.$) '

# Other settings
setopt autocd
setopt notify

# Enable completions
autoload -Uz compinit
compinit

# Make Zsh faster by disabling unnecessary options
unsetopt BEEP

