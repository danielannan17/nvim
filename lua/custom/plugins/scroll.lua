return {
  {
    'sphamba/smear-cursor.nvim',
    opts = {},
  },
  {
    'declancm/cinnamon.nvim',
    version = '*', -- use latest release
    opts = {
      disabled = false,
      options = {
        mode = 'window',
      },
      keymaps = {
        -- Enable the provided 'basic' keymaps
        basic = true,
        -- Enable the provided 'extra' keymaps
        extra = true,
      },
      -- change default options here
    },
    config = function(_, opts)
      -- Apply cinnamon options
      require('cinnamon').setup(opts)
  

      vim.api.nvim_set_keymap(
        'n', -- Normal mode
        '<C-u>',
        '<C-u>zz',
        { noremap = true, silent = true }
      )
    end,
  },
}
