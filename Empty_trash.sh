#!/bin/bash
[ -d ~/.local/share/Trash ] && rm -rf ~/.local/share/Trash/* && echo "Emptied shared trash."
[ -d ~/.Trash ] && rm -rf ~/.Trash/* && echo "Emptied trash." # For Mac and some other systems.
