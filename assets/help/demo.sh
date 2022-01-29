while read -r l; do
  [[ -n "${l}" ]] && echo "${l}"
done <<< "
  # list available types,
  ${THE_SCRIPT_NAME} -l
  # generate editorconfig to .editorconfig file
  ${THE_SCRIPT_NAME} editorconfig > .editorconfig
"
