### dotfiles
These are my dotfiles with customization that I have come to prefer. The script `install.sh` will create symlinks for `zshrc`, `bashrc`, and `vimrc`; along with any others to be included. 

The dotfiles use 
- [Oh My ZSH](https://ohmyz.sh)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [Dracula Pro Theme](https://draculatheme.com/pro)

And my preferred terminal app is iTerm. Follow the installation instructions for each of the pages above to get everything working.

### Installing
To install the software, simply run:
`./install.sh`


### Directory structure:
```
.
├── .comp
│   └── _venv
├── bin
│   ├── editor
│   ├── github_issues
│   ├── itunes-track
│   └── nowplaying
├── dotfiles
│   ├── bashrc
│   ├── p10k.zsh
│   ├── vimrc
│   ├── zlogin
│   ├── zshenv
│   └── zshrc
├── dotfiles_old
│   ├── bashrc -> ~/Documents/GitHub/dotfiles/dotfiles/bashrc
│   ├── p10k.zsh -> ~/Documents/GitHub/dotfiles/dotfiles/p10k.zsh
│   ├── vimrc -> ~/Documents/GitHub/dotfiles/dotfiles/vimrc
│   ├── zlogin -> ~/Documents/GitHub/dotfiles/dotfiles/zlogin
│   ├── zshenv -> ~/Documents/GitHub/dotfiles/dotfiles/zshenv
│   └── zshrc -> ~/Documents/GitHub/dotfiles/dotfiles/zshrc
├── iTerm2
│   ├── Default\ Profile.json
│   └── Dracula\ Pro.itermcolors
├── .DS_Store
├── .gitignore
├── .nanorc
├── .powerlevelrc
├── .zsh_addons
├── .zshrc
├── README.md
└── install.sh
```