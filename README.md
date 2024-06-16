# betterquit.nvim

Make :q close the current buffer, or all of Neovim if the current buffer is the last one.

:q will also close all of Neovim if the only remaining buffers are read-only or otherwise not being used for editing text (i.e. a quickfix list, or from a plugin.)

The behavior of :q! is unchanged.

That's it.

## Installation (with Lazy.nvim)

```lua
    {
      'Dillonb/betterquit.nvim',
      init = function()
        require("betterquit").setup{}
      end,
    }
```
