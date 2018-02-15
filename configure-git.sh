#!/bin/sh
git config --global user.name "Tim Otlik"
git config --global user.email "t.otlik@vivaldi.net"
git config --global core.autocrlf input
git config --global core.editor nano
git config --global alias.br branch
git config --global alias.st status
git config --global alias.sd "stash drop"
git config --global alias.sc "stash clear"

gpg_id=$(gpg --list-secret-keys --keyid-format LONG | grep sec | grep -Eo '(/[A-Z0-9]*)\s' | cut -d "/" -f 2)
if [ "$gpg_id" ]; then
	git config --global commit.gpgsign true
	git config --global user.signingkey $gpg_id
fi
