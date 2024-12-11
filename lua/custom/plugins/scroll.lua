return {
  {
    'sphamba/smear-cursor.nvim',
    opts = {},
  },
  {
    'declancm/cinnamon.nvim',
    version = '*', -- use latest release
    opts = {
      disabled = true,
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
  },
}
