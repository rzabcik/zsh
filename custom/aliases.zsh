# remaps
alias ls='ls --color=auto'
alias pushd='pushd .'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias wget='curl -O'

# short
alias l='env LC_ALL=C ls -lAXvhk --group-directories-first --color=auto'
alias o='xdg-open'
alias u='cd ..'
alias h='clear; cd; exec bash'
alias r='clear; exec bash'
alias y='yaourt --noconfirm'
alias p='sudo pacman --color auto'
alias s='sudo'
alias sys='sudo systemctl'

# new functions (particularly lengthy ones may be candidates for moving into .bash/functions)
alias lsmnt='mount | column -t'
alias lsdb='dropbox ls /data/Dropbox'
alias dl='cd /media/data0/Downloads'
alias db='builtin cd /media/data0/Dropbox; dropbox ls'
alias randomport='random.org 49152 65535'
alias yupd='yaourt -Syua --devel --noconfirm'
alias upd='sudo pacman -Su'
alias vimcrypt='vim -u ~/.vimcrypt -x'
alias nettest='ping -c 5 utexas.edu && curl http://speedtest.dallas.linode.com/100MB-dallas.bin -m 10 > /dev/null'
alias netstop='sudo netctl stop-all'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias pez='ssh ryanz@pez.cs.utexas.edu'
alias backup='sudo rsync -aPAX --delete --exclude={/dev/*,/proc/*,/sys/*,/tmp/*,/run/*,/mnt/*,/media/*,/lost+found} /* /media/backup'
alias hibernate='sudo /usr/lib/systemd/systemd-sleep hibernate'

# error-correcting
alias :q='exit'
alias :wq='exit'
