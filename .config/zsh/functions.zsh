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
  local file="$1"
  realpath $file | wl-copy
}
