[[ -n "${BASH_VERSION}" ]] && {
  __iife() {
    unset __iife
    local projdir="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

    [[ "$(type -t pathadd.append)" != 'function' ]] && return

    GEN_CONF_BINDIR="${GEN_CONF_BINDIR:-${projdir}/bin}"
    [[ -z "$(bash -c 'echo ${GEN_CONF_BINDIR+x}')" ]] \
      && export GEN_CONF_BINDIR

    pathadd.append "${GEN_CONF_BINDIR}"
  } && __iife
}
