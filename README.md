# vim-makeTemplate
  
![Support Neovim 0.2.0 or above](https://img.shields.io/badge/support-Neovim%200.2.0%20or%20above-bluegreen.svg?style=flat-square)
![Support Vim 8.1 or above](https://img.shields.io/badge/support-Vim%208.17%20or%20above-darkgreen.svg?style=flat-square)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](LICENSE)
  
A Vim plugin to instantly generate starter templates for Makefile, CMakeLists.txt, and QMake .pro files.  
  
## Features
 
- Create Makefile templates
- Create QMake project files (.pro)
- Create CMakeLists.txt templates

## Install
 
Use [junegunn/vim-plug] or [Shougo/dein.vim] like:
 
```vim
" Plug.vim
Plug 'pbalykov/vim-makeTemplate'
 
" dein.vim
call dein#add('pbalykov/vim-makeTemplate')
```
 
Or copy contents of the repository into your runtimepath manually.

## Usage

- `:SamleMake` - Create Makefile template
- `:SamleCMake` - Create CMakeLists.txt template
- `:SamleQmake <project_name>` - Create QMake project file

## Authors
pbalykov - developer [github](https://github.com/pbalykov) куда можно добавитьь пример
