#!/bin/bash
# This was a script to give me a menu of my commonly edited configuration files.
#   _____  _____  _____
set -eou pipefail
clear
OPTIONS=("localrc
bash_aliases
alacritty
tmux-conf
vimrc
edot
scripts
exrc
inputrc
curlrc
vifmrc
taskrc
bashrc
bash_profile
Xresources
xsession
steam-cfg
ackrc
ctags
QUIT
EXIT")

#cwmrc
#kshrc
#xscreensaver
#mybar.sh
#sxhkdrc
#dunstrc

while true;
do
    CHOICE="$(/usr/bin/echo -e "${OPTIONS[@]}" | /usr/bin/fzf --prompt="Select a File : " --header-first --border=rounded --margin=5% --color=dark --height 100% --reverse --header="           CONFIGS " --info=hidden --header-first --bind alt-j:preview-down,alt-k:preview-up --preview-window=right:65%)"

    case "$CHOICE" in
		localrc)
			CHOICE="$HOME/.localrc"
			"${SCRIPTSDIR}"/vimprev "$CHOICE"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "$choice"
			#else
				#tmux neww bash -c "nvim $choice"
			#fi
			;;
		bash_aliases)
			CHOICE="$HOME/.bash_aliases"
			"${SCRIPTSDIR}"/vimprev "$CHOICE"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "$choice"
			#else
				#tmux neww bash -c "nvim $choice"
			#fi
			;;
		alacritty)
			CHOICE="$HOME/.config/alacritty/alacritty.toml"
			"${SCRIPTSDIR}"/vimprev "$CHOICE"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "$choice"
			#else
				#tmux neww bash -c "nvim $choice"
			#fi
			;;
		tmux-conf)
			CHOICE="$HOME/.tmux.conf"
			"${SCRIPTSDIR}"/vimprev "$CHOICE"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "$choice"
			#else
				#tmux neww bash -c "nvim $choice"
			#fi
			;;
		vimrc)
			CHOICE="$HOME/.config/nvim"
			"${SCRIPTSDIR}"/vimprev "$CHOICE"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "$choice"
			#else
				#tmux neww bash -c "nnvim $choice"
			#fi
			;;
		edot)
			CHOICE="$HOME/scripts/edot.sh"
			"${SCRIPTSDIR}"/vimprev "$CHOICE"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "$choice.sh"
			#else
				#tmux neww bash -c "nvim $choice.sh"
			#fi
			;;
		scripts)
			CHOICE="$HOME/scripts"
			"${SCRIPTSDIR}"/vimprev "$CHOICE"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "$choice"
			#else
				#tmux neww bash -c "nnvim $choice"
			#fi
			;;
		exrc)
			CHOICE="$HOME/.exrc"
			/usr/bin/nvi "$CHOICE"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "$choice"
			#else
				#tmux neww bash -c "nvim $choice"
			#fi
			;;
		inputrc)
			CHOICE="$HOME/.inputrc"
			"${SCRIPTSDIR}"/vimprev "$CHOICE"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "$choice"
			#else
				#tmux neww bash -c "nvim $choice"
			#fi
			;;
		curlrc)
			CHOICE="$HOME/.curlrc"
			"${SCRIPTSDIR}"/vimprev "$CHOICE"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "$choice"
			#else
				#tmux neww bash -c "nvim $choice"
			#fi
			;;
		vifmrc)
			CHOICE="$HOME/.config/vifm/vifmrc"
			"${SCRIPTSDIR}"/vimprev "$CHOICE"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "$choice"
			#else
				#tmux neww bash -c "nnvim $choice"
			#fi
			;;
		taskrc)
			CHOICE="$HOME/.taskrc"
			"${SCRIPTSDIR}"/vimprev "$CHOICE"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "$choice"
			#else
				#tmux neww bash -c "nvim $choice"
			#fi
			;;
		bashrc)
			CHOICE="$HOME/.bashrc"
			"${SCRIPTSDIR}"/vimprev "$CHOICE"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "$choice"
			#else
				#tmux neww bash -c "nvim $choice"
			#fi
			;;
        bash_profile)
			CHOICE="$HOME/.bash_profile"
			"${SCRIPTSDIR}"/vimprev "$CHOICE"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "$choice"
			#else
				#tmux neww bash -c "nvim $choice"
			#fi
            ;;
		Xresources)
            CHOICE="$HOME/.Xresources"
			"${SCRIPTSDIR}"/vimprev "$CHOICE"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "$choice"
			#else
				#tmux neww bash -c "nvim $choice"
			#fi
            ;;
		xsession)
			CHOICE="$HOME/.xsession"
			"${SCRIPTSDIR}"/vimprev "$CHOICE"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "$choice"
			#else
				#tmux neww bash -c "nvim $choice"
			#fi
			;;
		steam-cfg)
			/usr/bin/"${SCRIPTSDIR}"/vimprev "$HOME"/.steam/debian-installation/steamapps/common/Counter-Strike\ Global\ Offensive/game/csgo/cfg/autoexec.cfg
			;;
		ackrc)
			CHOICE="$HOME/.ackrc"
			"${SCRIPTSDIR}"/vimprev "$CHOICE"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "$choice"
			#else
				#tmux neww bash -c "nvim $choice"
			#fi
			;;
        ctags)
			CHOICE="$HOME/.ctags"
			"${SCRIPTSDIR}"/vimprev "$CHOICE"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "$choice"
			#else
				#tmux neww bash -c "nvim $choice"
			#fi
            ;;
        QUIT)
            printf "Program terminated.\n" && exit
            ;;
        EXIT)
            printf "Program terminated.\n" && exit
            ;;
        *)
            echo "Program terminated." && exit
            ;;
    esac
done
sleep 1
exit
