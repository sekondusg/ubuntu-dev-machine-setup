#!/bin/bash

# /usr/local/sbin/create-local-homedir.sh

# Log all output to syslog.
exec 1> >(logger -s -t $(basename "$0")) 2>&1

PAM_UID=$(id -u "${PAM_USER}")

if (( PAM_UID >= 1000 )); then
  install -o "${PAM_USER}" -g "${PAM_USER}" -m 0700 -d "/usr/local/home/${PAM_USER}"
fi
