local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)%{$reset_color%}"

function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

function ssh_connection() {
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    ssh_prompt="[@%{$fg_bold[cyan]%}$(hostname)%{$reset_color%}] "
  else
    ssh_prompt=""
  fi
  echo $ssh_prompt
}

function virtual_env() {
  if [ -n "$VIRTUAL_ENV" ]; then
    venv_prompt=" (%{$fg[yellow]%}$(basename $VIRTUAL_ENV)%{$reset_color%})"
  else
    venv_prompt=""
  fi
  echo $venv_prompt
}

PROMPT='$(ssh_connection)$ret_status$(virtual_env) %{$fg[white]%}$(get_pwd) $(git_prompt_info)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✓%{$reset_color%}"
