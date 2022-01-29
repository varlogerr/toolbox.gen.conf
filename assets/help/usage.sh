while read -r l; do
  [[ -n "${l}" ]] && echo "${l}"
done <<< "
  ${THE_SCRIPT_NAME} [TYPE]
  ${THE_SCRIPT_NAME} -l
"
