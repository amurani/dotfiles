#!/bin/bash

HOMEDIR=$HOME
DOTFILEDIR="$HOME/.dotfiles"
CONFIGFILEDIR="$HOME/.dotfiles/.config"
CONFIGDIR="$HOME/.config"


dotfiles=$(ls -1 -A $DOTFILEDIR)
config_files=$(ls -1 -A $CONFIGFILEDIR)

if [[ $dotfiles ]]; then
    echo "Symlinking dotfiles to $DOTFILEDIR ..."
    for dotfile in $dotfiles; do
    	# Exclude" .git* related files, .config* related files, README.md, setup.sh or any other non- .dot file
	if [[ "$dotfile" =~ ^[.]+(git|config).*$ || ! "$dotfile" =~ ^[.]+.*$ ]]; then
		continue
    	fi

    	echo "dotfile -> $dotfile"

    	# this does replace any existing .dotfiles in home directory
    	ln -fs $DOTFILEDIR/$dotfile $HOMEDIR/$dotfile
    done
else
    echo "Could not fine any dotfiles in: '$DOTFILEDIR' ¯\_(ツ)_/¯"
fi

if [[ $config_files ]]; then
    printf "\n"
    echo "Symlinking .config files to $CONFIGDIR ..."

	for config_file in $config_files; do
		echo "config -> $config_file"

        # this does replace any existing .config/* in home directory
        ln -fns $CONFIGFILEDIR/$config_file $CONFIGDIR/$config_file
	done
else
    echo "Could not fine any .config in: '$CONFIGFILEDIR' ¯\_(ツ)_/¯"
fi

