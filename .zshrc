# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# List of plugins used
plugins=(
    git
    sudo
    archlinux
    zsh-256color
    zsh-autosuggestions
    zsh-syntax-highlighting
    colored-man-pages
    )

source $ZSH/oh-my-zsh.sh

# In case a command is not found, try to find the package that has it
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]] ; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

function in {
    local pkg="$1"
    if pacman -Si "$pkg" &>/dev/null ; then
        sudo pacman -S "$pkg"
    else 
        "$aurhelper" -S "$pkg"
    fi
}

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

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Some zellij helpers

function zr () { zellij run --name "$*" -- zsh -ic "$*";}
function zrf () { zellij run --name "$*" --floating -- zsh -ic "$*";}
function zri () { zellij run --name "$*" --in-place -- zsh -ic "$*";}
function ze () { zellij edit "$*";}
function zef () { zellij edit --floating "$*";}
function zei () { zellij edit --in-place "$*";}
function zpipe () {
  if [ -z "$1" ]; then
    zellij pipe;
  else
    zellij pipe -p $1;
  fi
}

zellij_tab_name_update() {
    if [[ -n $ZELLIJ ]]; then
        local current_dir=$PWD
        if [[ $current_dir == $HOME ]]; then
            current_dir="~"
        else
            current_dir=${current_dir##*/}
        fi
        command nohup zellij action rename-tab $current_dir >/dev/null 2>&1
    fi
}

zellij_tab_name_update
chpwd_functions+=(zellij_tab_name_update)

# Disable vim mode
bindkey -e

# Helpful aliases
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
# alias ld='eza -lhD --icons=auto' # long list dirs
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list avaialabe package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
alias lg='lazygit'
alias ld='lazydocker'
alias nv='nvim'
alias cat='bat'
alias sysstart='sudo systemctl start'
alias sysstop='sudo systemctl stop'
alias rga='rg --hidden --no-ignore'
alias cdf='cd $(find * -type d | fzf)'
alias pacsear="pacman -Slq | sk --multi --preview 'pacman -Si {1}'"
alias pacsearin="pacman -Slq | sk --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias yasear="yay -Slq | sk --multi --preview 'yay -Si {1}'"
alias yasearin="yay -Slq | sk --multi --preview 'yay -Si {1}' | xargs -rp yay -S"
alias uvp="uv pip"
#alias =''

# other aliases
source ~/.config/zsh/*

# Custom exports
export VISUAL="nvim"
export EDITOR="nvim"

eval "$(atuin init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

if [[ -z $(echo $ZELLIJ_SESSION_NAME) ]]; then
  zellij
fi
