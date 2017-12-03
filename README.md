# Dotfiles

A collection of common dotfiles that I use across my devices

## Contents

- **colors.itermcolors**: Color presets for iTerm
- **.eslintrc**: A common config for eslint
- **.pdbrc**: Utils for pdb/pytest
- **.vimrc**: Vim configuration

## Set up

### First of all

Go to App Store and install Xcode

Extract the repo content to the home

```
git init
git remote add origin git@github.com:joanvila/dotfiles.git
git pull origin master
```

### iTerm

Download and install:

```
https://www.iterm2.com/
```

- Once installed, under preferences > appearance, select `Theme: Dark`.
- Under preferences > profile > session, mark `Do not prompt before closing`.
- Under preferences > profile > colors, import the `colors.itermcolors` colors presets from this repo.

### Install the basics

When I wrote this, to work with React, the versions required were `npm 4.x and node v7.x`

And the easiest way to install specific versions was with `nvm`:

```
https://github.com/creationix/nvm
```

Install brew:

```
https://brew.sh/
```

Install ag:

```
brew install the_silver_searcher
```

### Install vim plugin dependencies:

Python linter:

```
pip install flake8
```

JS linter:

```
npm install -g eslint
npm install -g babel-eslint
npm install -g eslint-plugin-react
```

### Install Vundle and Vim plugins

Install Vundle (Vim plugin manager):

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Install the plugins:

```
vim +PluginInstall +qall
```

