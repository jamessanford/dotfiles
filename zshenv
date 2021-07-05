# do not use /etc/zsh
unsetopt GLOBAL_RCS

# TODO: should really use an ip map for this

# add IP to allow list, bypass ratelimiting
if [ ! -z "${SSH_CONNECTION}" ]; then
  _ip=$(echo ${SSH_CONNECTION} | awk '{print $1}')
  echo "${_ip}" | grep -q '^192.168'
  if [ $? -ne 0 ]; then
    if [[ ! -z "${_ip}" ]]; then
      if [[ "${_ip}" =~ ':' ]]; then
        _t=ip6tables
        _ip="${_ip}/128"
      else
        _t=iptables
        _ip="${_ip}/32"
      fi
      if ! sudo ${_t} -S INPUT | grep -q "${_ip}"; then
        sudo ${_t} -I INPUT 1 -s "${_ip}" -p tcp -m tcp --dport 22 -j ACCEPT
      fi
    fi
  fi
  unset _t
  unset _ip
fi
if [ -e /Users/jsanford/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/jsanford/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
