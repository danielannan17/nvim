-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
local function get_script_directory()
  local info = debug.getinfo(1, 'S')
  local path = info.source:sub(2) -- Remove the leading '@'
  -- Match everything up to the last path separator
  return path:match '(.+[/\\])'
end
vim.cmd('source ' .. get_script_directory() .. '/remaps.vim')
vim.cmd('source ' .. get_script_directory() .. '/customCommands.vim')

vim.opt.termguicolors = true
local function smart_undo()
  local start_pos = vim.api.nvim_buf_get_mark(0, '[')
  local cur_pos = vim.api.nvim_win_get_cursor(0)

  -- Compare starting column with current column
  local has_typed = start_pos[2] ~= cur_pos[2] - 1

  if has_typed then
    vim.cmd 'undo'
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>u', true, false, true), 'n', true)
  end
end

vim.keymap.set('i', '<C-z>', smart_undo, { noremap = true, silent = true })

vim.keymap.set('t', '<C-c>', '<C-c>')
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Automatically enter insert mode when entering a terminal window
vim.api.nvim_create_autocmd('TermEnter', {
  pattern = '*',
  command = 'startinsert',
})

return {
  'joshuavial/aider.nvim',
  'deris/vim-shot-f',
  'norcalli/nvim-colorizer.lua',
  'ggandor/leap.nvim',
  'ggandor/flit.nvim',
  'sindrets/diffview.nvim',
  -- {
  --   'OXY2DEV/markview.nvim',
  --   lazy = false, -- Recommended
  --   -- ft = "markdown" -- If you decide to lazy-load anyway
  --
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --     'nvim-tree/nvim-web-devicons',
  --   },
  -- },
  {
    "debugloop/telescope-undo.nvim",
    dependencies = { -- note how they're inverted to above example
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    keys = {
      { -- lazy style key map
        "<leader>su",
        "<cmd>Telescope undo<cr>",
        desc = "undo history",
      },
    },
    opts = {
      -- don't use `defaults = { }` here, do this in the main telescope spec
      extensions = {
        undo = {
          saved_only = true
        },
        -- no other extensions here, they can have their own spec too
      },
    },
    config = function(_, opts)
      -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
      -- configs for us. We won't use data, as everything is in it's own namespace (telescope
      -- defaults, as well as each extension).
      require("telescope").setup(opts)
      require("telescope").load_extension("undo")
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  -- vs code like search and replace 
  {
    'MagicDuck/grug-far.nvim',
    config = function()
      require('grug-far').setup({
        -- options, see Configuration section below
        -- there are no required options atm
        -- engine = 'ripgrep' is default, but 'astgrep' can be specified
      });
    end
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
  -- Search grep grouped by file 
  {
    'fdschmidt93/telescope-egrepify.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  },
  {
    'supermaven-inc/supermaven-nvim',
    cmd = {
      'SupermavenStart',
    },
    opts = {
      --- Your configuration options
    },
  },
  { 'tenxsoydev/karen-yank.nvim', config = true },
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  {
    'AckslD/nvim-neoclip.lua',
    dependencies = {
      -- you'll need at least one of these
      { 'nvim-telescope/telescope.nvim' },
      -- {'ibhagwan/fzf-lua'},
    },
    config = function()
      require('neoclip').setup()
    end,
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('bufferline').setup {
        options = {
          separator_style = 'slant', -- Customize separator style
          show_buffer_close_icons = true,
          show_close_icon = true,
          always_show_bufferline = true,
          diagnostics = 'nvim_lsp', -- Show diagnostics from LSP
          offsets = {
            {
              filetype = 'neo-tree',
              text = 'File Explorer',
              text_align = 'center',
              separator = true,
            },
          },
        },
      }
    end,
  },
}
