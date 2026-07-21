function gnew {
  local repo_name="$1"
  mkdir $repo_name
  cd $repo_name
  git init
}

function jelly {
  local source="$1"

  if [[ "$1" == "--clear" ]]; then
    unset JELLY_USER JELLY_IP JELLY_DEST
    echo "Jelly variables cleared."
    return
  fi

  if [[ -z "$JELLY_USER" ]]; then
    echo -n "Enter remote user: "
    read JELLY_USER
  fi

  if [[ -z "$JELLY_IP" ]]; then
    echo -n "Enter remote IP: "
    read JELLY_IP
  fi

  if [[ -z "$JELLY_PATH" ]]; then
    echo -n "Enter remote path: "
    read JELLY_PATH
  fi

  scp "$source" "${JELLY_USER}@${JELLY_IP}:${JELLY_PATH}"
}

function copypath {
  local git_relative=false
  local OPTIND=1

  while getopts "g" opt; do
    case "$opt" in
      g) git_relative=true ;;
    esac
  done
  shift $((OPTIND - 1))

  local file="${1:-.}"
  local abs_path
  abs_path="$(realpath "$file")"

  if [[ "$git_relative" == true ]]; then
    local git_root
    if ! git_root="$(git rev-parse --show-toplevel 2>/dev/null)"; then
      echo "Not in a git repo"
      return 1
    fi
    abs_path="${abs_path#"$git_root"/}"
  fi

  printf '%s' "$abs_path" | wl-copy -n
}

function create_3d_dirs {
  if [[ -z "$1" ]]; then
    head="."
  else
    head="$1"
  fi

  mkdir -p $head/{src,exports,gcode}
  cd $head
}

function cdr {
  if git rev-parse >/dev/null 2>&1 ; then
    cd $(git rev-parse --show-toplevel)
  else
    "Not in a git repo"
  fi
}
