# --  Aliases ------------------------------------------------------------------

# alias python='python3'
alias ls="ls -lhG"
alias G="git"


# -- Vim sessions --------------------------------------------------------------

function vim() {
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

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"


# -- SPACESHIP PROMPT ----------------------------------------------------------

autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_PROMPT_ORDER=(char)
SPACESHIP_CHAR_SYMBOL="$ "


# -- Paths ---------------------------------------------------------------------

# ruby
PATH=$PATH:/usr/local/bin
# source ~/.profile

# android
export JAVA_HOME=$(/usr/libexec/java_home -v 11)
export ANDROID_SDK_ROOT=~/Library/Android/sdk/
export PATH=$PATH:~/Library/Android/sdk/platform-tools/

# # heroku autocomplete setup
# HEROKU_AC_ZSH_SETUP_PATH=/Users/nico/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

export REACT_EDITOR=vim

export SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.3.sdk
