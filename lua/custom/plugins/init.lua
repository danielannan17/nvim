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
vim.opt.termguicolors = true
return {
  'deris/vim-shot-f',
  'ggandor/leap.nvim',
  'ggandor/flit.nvim',
  {
    'declancm/cinnamon.nvim',
    version = '*', -- use latest release
    opts = {
      disabled = true,

      keymaps = {
        -- Enable the provided 'basic' keymaps
        basic = true,
        -- Enable the provided 'extra' keymaps
        extra = true,
      },
      -- change default options here
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
    version = "*",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("bufferline").setup({
        options = {
          separator_style = "slant", -- Customize separator style
          show_buffer_close_icons = true,
          show_close_icon = true,
          always_show_bufferline = true,
          diagnostics = "nvim_lsp", -- Show diagnostics from LSP
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              text_align = "center",
              separator = true,
            },
          },
        },
      })
    end,
  }
}
