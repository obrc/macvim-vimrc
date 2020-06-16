# 我的 MacVim 配置文件

## 使用

```shell
git clone git@github.com:superbrace/macvim-vimrc.git ~/.vim
```

安装 [vim-plug](https://github.com/junegunn/vim-plug)

link file
```shell
$ ln -s ~/.vim/vimrc ~/.vimrc
$ ln -s ~/.vim/gvimrc ~/.gvimrc
```
## vim 插件

powerline 需要事先安装 [powerline-status](https://pypi.org/project/powerline-status/)
> 因为没有配置 [bindings for vim](https://stackoverflow.com/questions/47402481/powerline-not-work-in-vim) 导致 powerline 没有显示

## c++ 插件

```shell
Plug 'skywind3000/asyncrun.vim'
Plug 'dense-analysis/ale'
Plug 'ycm-core/YouCompleteMe'
Plug 'mhinz/vim-signify'
Plug 'octol/vim-cpp-enhanced-highlight'
```

其中 YCM 需用使用 pythone3 安装
