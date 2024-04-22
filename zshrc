# --  Aliases ------------------------------------------------------------------

# alias python='python3'
alias ls="ls -lhG"
alias G="git"
alias vv="vifm"
alias vim=v


# -- ZSH Z ---------------------------------------------------------------------

source "$(brew --prefix zsh-autocomplete)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
source "$(brew --prefix z)/etc/profile.d/z.sh"

ZSHZ_CASE=smart
ZSHZ_TILDE=1
autoload -U compinit; compinit
zstyle ':completion:*' menu select

# -- Vim sessions --------------------------------------------------------------

function v() {
  if test $# -gt 0; then
    env nvim "$@"
  elif test -f Session.vim; then
    env nvim -S
  else
    env nvim -c Obsess
  fi
}


# -- GIT -----------------------------------------------------------------------

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 50% "$@" # --border
}

git-b() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:71% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

git-f() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- |
  sed 's/.* -> //'
}

git-h() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}

join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local c
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(git-$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g$c' fzf-g$c-widget"
  done
}

bind-git-helper f b t r h
unset -f bind-git-helper


# -- FZF -----------------------------------------------------------------------

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --ignore-case --hidden --follow --ignore-file ".rgignore" --glob "!{node_modules/*,.git/*}" "$@"'
export FZF_DEFAULT_OPTS='--color=bg+:#1D2227,bg:#1D2227,border:#3D4751,spinner:#457B9C,hl:#FC9D9A,fg:#D9D7CE,header:-1,info:#607080,pointer:#3B8686,marker:#457B9C,fg+:#79BD9A,prompt:#3B8686,hl+:#F07178'
# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"


# -- NNN -----------------------------------------------------------------------

export NNN_PLUG='f:fzplug'


# -- SPACESHIP PROMPT ----------------------------------------------------------

autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_PROMPT_ORDER=(char)
SPACESHIP_CHAR_SYMBOL="$ "


# -- Paths ---------------------------------------------------------------------

#brew
CPU=$(uname -p)
if [[ "$CPU" == "arm" ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
else
    export PATH="/usr/local/bin:$PATH"
fi

#node
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"  # This loads nvm
[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix nvm)/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# android
# export CPPFLAGS="-I$(brew --prefix openjdk@11)/include"
export PATH="$(brew --prefix openjdk@11)/bin:$PATH"

export JAVA_HOME=$(/usr/libexec/java_home -v 11)
export ANDROID_SDK_ROOT=~/Library/Android/sdk/
PATH=$PATH:~/Library/Android/sdk/platform-tools/

# rbenv
[[ -f $(command -v rbenv) ]] && eval "$(rbenv init - zsh)"

PATH="$(brew --prefix ncurses)/bin:$PATH"

# flutter
PATH="$PATH:/Users/nico/fvm/default/bin"
PATH="$PATH":"$HOME/.pub-cache/bin"
PATH="/Users/nico/fvm/versions/stable/bin:$PATH"
PATH="$PATH:/Volumes/class-dump-3.5/class-dump"

export REACT_EDITOR=vim
export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)

export PATH=$PATH

export TERM=screen-256color-bce
