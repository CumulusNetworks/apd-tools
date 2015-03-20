ACPI Source Language (ASL) Syntax Highlighting for vim
======================================================

# Install

```sh
cp vim.asl $HOME/.vim/syntax/
```

then add to your .vimrc:

```vimrc
autocmd BufNew,BufRead *.asl setf asl
autocmd BufNew,BufRead *.asli setf asl
```
