#!/bin/bash
# - This was a script to give me a menu of my commonly edited configuration files. ---- #
#   _____  _____  _____
set -eou pipefail
clear
my_options=("localrc
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
    my_choice="$(/usr/bin/echo -e "${my_options[@]}" | /usr/bin/fzf --prompt="Select a File : " --header-first --border=rounded --margin=5% --color=dark --height 100% --reverse --header="           CONFIGS " --info=hidden --header-first --bind alt-j:preview-down,alt-k:preview-up --preview-window=right:65%)"

    case "${my_choice}" in
		localrc)
			my_choice="${HOME}/.localrc"
			"${SCRIPTDIR}"/vimprev "${my_choice}"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "${my_choice}"
			#else
				#tmux neww bash -c "nvim ${my_choice}"
			#fi
			;;
		bash_aliases)
			my_choice="${HOME}/.bash_aliases"
			"${SCRIPTDIR}"/vimprev "${my_choice}"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "${my_choice}"
			#else
				#tmux neww bash -c "nvim ${my_choice}"
			#fi
			;;
		alacritty)
			my_choice="${HOME}/.config/alacritty/alacritty.toml"
			"${SCRIPTDIR}"/vimprev "${my_choice}"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "${my_choice}"
			#else
				#tmux neww bash -c "nvim ${my_choice}"
			#fi
			;;
		tmux-conf)
			my_choice="${HOME}/.tmux.conf"
			"${SCRIPTDIR}"/vimprev "${my_choice}"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "${my_choice}"
			#else
				#tmux neww bash -c "nvim ${my_choice}"
			#fi
			;;
		vimrc)
			my_choice="${HOME}/.config/nvim"
			"${SCRIPTDIR}"/vimprev "${my_choice}"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "${my_choice}"
			#else
				#tmux neww bash -c "nnvim ${my_choice}"
			#fi
			;;
		edot)
			my_choice="${HOME}/scripts/edot.sh"
			"${SCRIPTDIR}"/vimprev "${my_choice}"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "${my_choice}.sh"
			#else
				#tmux neww bash -c "nvim ${my_choice}.sh"
			#fi
			;;
		scripts)
			my_choice="${HOME}/scripts"
			"${SCRIPTDIR}"/vimprev "${my_choice}"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "${my_choice}"
			#else
				#tmux neww bash -c "nnvim ${my_choice}"
			#fi
			;;
		exrc)
			my_choice="${HOME}/.exrc"
			/usr/bin/nvi "${my_choice}"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "${my_choice}"
			#else
				#tmux neww bash -c "nvim ${my_choice}"
			#fi
			;;
		inputrc)
			my_choice="${HOME}/.inputrc"
			"${SCRIPTDIR}"/vimprev "${my_choice}"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "${my_choice}"
			#else
				#tmux neww bash -c "nvim ${my_choice}"
			#fi
			;;
		curlrc)
			my_choice="${HOME}/.curlrc"
			"${SCRIPTDIR}"/vimprev "${my_choice}"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "${my_choice}"
			#else
				#tmux neww bash -c "nvim ${my_choice}"
			#fi
			;;
		vifmrc)
			my_choice="${HOME}/.config/vifm/vifmrc"
			"${SCRIPTDIR}"/vimprev "${my_choice}"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "${my_choice}"
			#else
				#tmux neww bash -c "nnvim ${my_choice}"
			#fi
			;;
		taskrc)
			my_choice="${HOME}/.taskrc"
			"${SCRIPTDIR}"/vimprev "${my_choice}"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "${my_choice}"
			#else
				#tmux neww bash -c "nvim ${my_choice}"
			#fi
			;;
		bashrc)
			my_choice="${HOME}/.bashrc"
			"${SCRIPTDIR}"/vimprev "${my_choice}"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "${my_choice}"
			#else
				#tmux neww bash -c "nvim ${my_choice}"
			#fi
			;;
        bash_profile)
			my_choice="${HOME}/.bash_profile"
			"${SCRIPTDIR}"/vimprev "${my_choice}"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "${my_choice}"
			#else
				#tmux neww bash -c "nvim ${my_choice}"
			#fi
            ;;
		Xresources)
            my_choice="${HOME}/.Xresources"
			"${SCRIPTDIR}"/vimprev "${my_choice}"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "${my_choice}"
			#else
				#tmux neww bash -c "nvim ${my_choice}"
			#fi
            ;;
		xsession)
			my_choice="${HOME}/.xsession"
			"${SCRIPTDIR}"/vimprev "${my_choice}"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "${my_choice}"
			#else
				#tmux neww bash -c "nvim ${my_choice}"
			#fi
			;;
		steam-cfg)
			/usr/bin/"${SCRIPTDIR}"/vimprev "${HOME}"/.steam/debian-installation/steamapps/common/Counter-Strike\ Global\ Offensive/game/csgo/cfg/autoexec.cfg
			;;
		ackrc)
			my_choice="${HOME}/.ackrc"
			"${SCRIPTDIR}"/vimprev "${my_choice}"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "${my_choice}"
			#else
				#tmux neww bash -c "nvim ${my_choice}"
			#fi
			;;
        ctags)
			my_choice="${HOME}/.ctags"
			"${SCRIPTDIR}"/vimprev "${my_choice}"
			#if ! /usr/bin/pidof /usr/bin/tmux &>/dev/null; then
				#nvim "${my_choice}"
			#else
				#tmux neww bash -c "nvim ${my_choice}"
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
