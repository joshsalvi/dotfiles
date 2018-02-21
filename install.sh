#!/usr/bin/env zsh
files=( ".zsh_addons" ".zshrc" ".nanorc" ".powerlevelrc" )
bins=( "editor" "nowplaying" "github_issues" )
completions=( "_venv" )
scripts=( ".autoenv.zsh" ".autoenv_leave.zsh" )


mkdir -p $HOME/.dotfiles/bin $HOME/.dotfiles/backup $HOME/.dotfiles/.comp $HOME/.dotfiles/scripts

if [ -d ~/.nanorc ]; then
echo "Cloning and installing .nanorc files from github..."
git clone https://github.com/nanorc/nanorc nanofiles
cd nanofiles
make install
cd ..
rm -rf nanofiles
fi

echo "Copying files..."
for file in ${files[@]}; do
    cp $file $HOME/.dotfiles/$file
    if [ ! -L $HOME/$file ]; then
        mv $HOME/$file $HOME/.dotfiles/backup/$file
    fi
    ln -s $HOME/.dotfiles/$file $HOME/$file
done

echo "Copying binaries..."
for bin in ${bins[@]}; do
    cp bin/$bin $HOME/.dotfiles/bin/$bin
    chmod +x $HOME/.dotfiles/bin/$bin
done

echo "Copying completions..."
for completion in ${completions[@]}; do
    cp .comp/$completion $HOME/.dotfiles/.comp/$completion
    chmod +x $HOME/.dotfiles/.comp/$completion
done

echo "Copying scripts..."
for script in ${scripts[@]}; do
    cp scripts/$script $HOME/.dotfiles/scripts/$script
    chmod +x $HOME/.dotfiles/scripts/$script
done


if [ `uname` = "Linux" ]; then
  echo "Installation of libsecret-1-dev needed, sudo is necessary..."
  sudo apt update -qq
  sudo apt install libsecret-1-dev curl python-pygments -y -qq
fi
echo "Installing dependencies..."

if [ `uname` = "Linux" ]; then
  curl -sL https://gist.githubusercontent.com/wandernauta/6800547/raw/2c2ad0f3849b1b1cd1116b80718d986f1c1e7966/sp -o $HOME/.dotfiles/bin/sp
  chmod +x $HOME/.dotfiles/bin/sp
  if [ -z `node --version` ]; then
    mkdir ~/local
    mkdir ~/node-latest-install
    cd ~/node-latest-install
    curl -s http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1
    ./configure --prefix=~/local
    make install # ok, fine, this step probably takes more than 30 seconds...
    curl https://www.npmjs.org/install.sh | sh
  fi
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


echo "Done!"
echo "Please restart your shell now"
