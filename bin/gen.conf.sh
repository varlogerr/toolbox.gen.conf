#!/usr/bin/env bash

THE_SCRIPT="${BASH_SOURCE[0]}"
THE_SCRIPT_NAME="$(basename "${THE_SCRIPT}")"
TOOL_DIR="$(realpath "$(dirname "$(realpath "${THE_SCRIPT}")")/..")"

SRC_DIR="${TOOL_DIR}/src"

get_types() {
  find "${SRC_DIR}" -mindepth 1 -maxdepth 1 -type f \
  | while read -r f; do basename "${f}"; done
}

print_help() {
  local help_dir="${TOOL_DIR}/assets/help"

  echo "Generate basic configuration files."

  echo
  echo "Usage:"
  . "${help_dir}/usage.sh" | sed 's/^/  /g'

  echo
  echo "Available options:"
  cat "${help_dir}/optlist.txt" | sed 's/^/  /g'

  echo
  echo "Demo:"
  . "${help_dir}/demo.sh" | sed 's/^/  /g'
}

declare -A OPTS=(
  [help]=0
  [list]=0
  [type]=''
)
while :; do
  [[ -z "${1+x}" ]] && break

  case "${1}" in
    -\?|-h|--help)  OPTS[help]=1 ;;
    -l|--list)      OPTS[list]=1 ;;
    *)              OPTS[type]="${1}" ;;
  esac

  shift
done

[[ ${OPTS[help]} -eq 1 ]] && \
  print_help && exit

[[ ${OPTS[list]} -eq 1 ]] && \
  get_types && exit

THE_FILE="${SRC_DIR}/${OPTS[type]}"

if \
  grep '/' <<< "${OPTS[type]}" \
  || [[ ! -f "${THE_FILE}" ]] \
; then
  echo "'${OPTS[type]}' is not a supported type!" >&2
  echo
  echo "Supported types:"
  get_types | sed 's/^/  /g'
  exit
fi

cat "${THE_FILE}"
