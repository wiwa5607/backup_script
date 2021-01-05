#!/bin/bash
HOMES='willwalker'
DRIVE="/media/willwalker/03E1-6552"

for HOME in $HOMES; do
	cd /home/$HOME
	rsync -cdlptgov --info=progress2 --exclude-from ./excludes.txt --delete . /$DRIVE/$HOME
	find . -maxdepth 1 -type d -not -name "." -exec rsync -crlptgov --info=progress2 --exclude-from ./excludes.txt --delete {} /$DRIVE/$HOME \;
done