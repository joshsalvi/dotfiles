#!/usr/bin/env zsh

if [ -d ~/.nanorc ]; then
echo "Cloning and installing .nanorc files from github..."
git clone https://github.com/nanorc/nanorc nanofiles
cd nanofiles
make install
cd ..
rm -rf nanofiles
fi


if [ `uname` = "Linux" ]; then
  curl -sL https://gist.githubusercontent.com/wandernauta/6800547/raw/2c2ad0f3849b1b1cd1116b80718d986f1c1e7966/sp -o $HOME/.dotfiles/bin/sp
  chmod +x $HOME/.dotfiles/bin/sp
elif [ `uname` = "Darwin" ]; then
  if [ -z `node --version` ]; then
    brew install node
  fi
fi

if [ ! -f $HOME/.dotfiles/bin/antigen.zsh ]; then
  curl -sL "git.io/antigen" -o $HOME/.dotfiles/bin/antigen.zsh && chmod +x $HOME/.dotfiles/bin/antigen.zsh
fi

if [ ! -d $NVM_DIR ]; then
  curl -o- "https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh" | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm install node
  npm install -g commitizen cz-conventional-changelog npm-check-updates
fi

