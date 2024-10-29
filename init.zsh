(( ${+commands[pdm]} )) && () {
  local command=${commands[pdm]}
  local compfile="$1/functions/_pdm"

  if [[ ! -e "$compfile" || "$compfile" -ot "$command" ]]; then
    pdm completion zsh >| "$compfile"
    zcompile -UR "$compfile"
    print -u2 -PR "* Detected a new version of 'pdm'. Regenerated completions."
  fi
} "${0:h}"
