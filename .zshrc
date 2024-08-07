eval "$(starship init zsh)"

export PATH=$HOME/.local/bin:$PATH

export TERMINAL=kitty

PATH=/root/.local/bin:/snap/bin:/usr/sandbox/:/opt:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/opt/nvim-linux64/bin



# Use modern completion system

autoload -Uz compinit

compinit

 

zstyle ':completion:*' auto-description 'specify: %d'

zstyle ':completion:*' completer _expand _complete _correct _approximate

zstyle ':completion:*' format 'Completing %d'

zstyle ':completion:*' group-name ''

zstyle ':completion:*' menu select=2

eval "$(dircolors -b)"

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' list-colors ''

zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

zstyle ':completion:*' menu select=long

zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s␍

zstyle ':completion:*' use-compctl false

zstyle ':completion:*' verbose true



zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'



# Custom Aliases

# -----------------------------------------------␍

# batcat

alias cat='batcat'

alias catn='batcat --style=plain'

alias catnp='batcat --style=plain --paging=never'

alias v='nvim'


# ls

alias ll='lsd -lh --group-dirs=first'

alias la='lsd -a --group-dirs=first'

alias l='lsd --group-dirs=first'

alias lla='lsd -lha --group-dirs=first'

alias ls='lsd --group-dirs=first'

alias env='source env/bin/activate'
alias venv='source venv/bin/activate'

alias ..='cd ..'
alias ....='cd ../../'
alias ......='cd ../../../'
alias work='cd ~/work'
alias practice='cd ~/practice'

# manage
alias py="python3"
alias pyk="python3 manage.py makemigrations"
alias pym="python3 manage.py migrate"
alias pyr="python3 manage.py runserver"
alias pyc="python3 manage.py collectstatic"


# git
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"

export LS_COLORS="rs=0:di=34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"



#plugins

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/sudo-plugin/sudo.plugin.zsh



eval "$(/home/heracle/anaconda3/bin/conda shell.zsh hook)"



#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/heracle/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/heracle/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/heracle/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/heracle/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
eval conda deactivate


o() {
  nvim $(find . -type f | fzf --preview='batcat --always=color {}')
}


own() {

  local dir=$(find /home/heracle -type d | fzf --preview 'lsd --icon always --color always --tree --depth 2 {}')
  if [ -z "$dir" ]; then
    echo "No directory selected."
    return 1
  fi

  # Cambia al directorio seleccionado
  cd "$dir" || return

  # Activa el entorno virtual si existe
  if [ -f "venv/bin/activate" ]; then
    source "venv/bin/activate"
  elif [ -f "env/bin/activate" ]; then
    source "env/bin/activate"
  else
    echo "No virtual environment found in $dir"
  fi

  # Abre Neovim en el directorio actual
  nvim .
}
