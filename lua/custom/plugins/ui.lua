return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        messages = {
          -- NOTE: If you enable messages, then the cmdline is enabled automatically.
          -- This is a current Neovim limitation.
          enabled = true, -- enables the Noice messages UI
          view = "mini", -- default view for messages
          view_error = "mini", -- view for errors
          view_warn = "mini", -- view for warnings
          view_history = "messages", -- view for :messages
          view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
        },
        dependencies = {
          -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
          "MunifTanjim/nui.nvim",
          -- OPTIONAL:
          --   `nvim-notify` is only needed, if you want to use the notification view.
          --   If not available, we use `mini` as the fallback
          -- "rcarriga/'nvim-notify",
        },
        notify = {
          -- Noice can be used as `vim.notify` so you can route any notification like other messages
          -- Notification messages have their level and other properties set.
          -- event is always "notify" and kind can be any log level as a string
          -- The default routes will forward notifications to nvim-notify
          -- Benefit of using Noice for this is the routing and consistent history view
          enabled = true,
          view = "mini",
        }
      },
      {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
          require('dashboard').setup {
            -- config
          }
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
      },
}