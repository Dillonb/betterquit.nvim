# betterquit.nvim

Make :q close the current buffer, or all of Neovim if the current buffer is the last one.

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
