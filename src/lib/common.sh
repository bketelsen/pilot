confirm_task() {
  echo "Task: $(green "$1")"
  read -p "$(red Press Enter To Continue / Ctrl-C to Cancel)"
}

header() {
  echo "$(green "$1")"
  echo
  echo $2
  echo
}

footer() {
  echo "----"
  echo "$(green "$1")"
  echo
  echo $2
  echo
}

start() {
  verbose=${args[--verbose]}
  if [[ $verbose ]]; then
    echo "[start] $(green "$1")"
  fi
}

finish() {
  verbose=${args[--verbose]}
  if [[ $verbose ]]; then
    echo "[end] $(green "$1")"
  fi
}

require_sudo() {
  if ! [ $(id -u) = 0 ]; then
    red "This command needs to be run as root." >&2
    exit 1
  fi
}

exists() {
  if  command -v $1 2>&1 >/dev/null; then
    return
  fi
  return 1
}

