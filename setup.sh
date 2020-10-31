#!/bin/bash

HOMEDIR=$HOME
DOTFILEDIR="$HOME/.dotfiles"

dotfiles=$(ls -1 -A $DOTFILEDIR)

if [[ $dotfiles ]]; then
    echo "Symlinking dotfiles..."
    for dotfile in $dotfiles; do
	    # Exclude" .git* related files, README.md, setup.sh or any other non- .dot file
	    if [[ "$dotfile" =~ ^[.]+git.*$ || ! "$dotfile" =~ ^[.]+.*$ ]]; then
   		    continue
 	    fi

    	echo "$dotfile"
	    # this does replace any existing .dotfiles in home directory
    	ln -fs $DOTFILEDIR/$dotfile $HOMEDIR/$dotfile
    done
else
    echo "Could not fine any dotfiles in: '$DOTFILEDIR' ¯\_(ツ)_/¯"
fi
