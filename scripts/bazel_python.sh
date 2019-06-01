#!/bin/bash

#Ref: https://help.dreamhost.com/hc/en-us/articles/215489338-Installing-and-using-virtualenv-with-Python-2

#SHELLSCRIPT BASEDIR
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

LOG_TAG='date +"[bazel-python] (%H:%M:%S)"'

# @Arguments
# [...]
log_i() {
  echo "$(eval $LOG_TAG) I: $@"
}

# @Arguments
# [...]
log_e() {
  echo "$(eval $LOG_TAG) E: $@"
}

# @Arguments
log_pipe(){
  while read message; do
    log_i $message
  done
}

# main
if [ ! -z ${VIRTUAL_ENV+x} ]; then
  log_i "Virtualenv has already been defined!"
  exit 0
fi

WORKDIR="$(realpath $BASEDIR/../build)/bazel-python"

log_i "Working on $WORKDIR"

# setup bazel-python
if [ ! -f "$WORKDIR" ]; then
  mkdir -p "$WORKDIR"
  log_i "Folder $WORKDIR has been created!"

  if [[ "$(pip show -q virtualenv; echo $?)" == "1" ]]; then
    log_i "Installing virtualenv..."
    pip install virtualenv --user | log_pipe
  fi

  virtualenv -p $(which python2.7) $WORKDIR | log_pipe
fi

if [ -z ${VIRTUAL_ENV+x} ]; then
  log_i "Please EXECUTE: source $WORKDIR/bin/activate"
fi

log_i "Finished on $WORKDIR"