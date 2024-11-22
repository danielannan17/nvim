-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
local function get_script_directory()
    local info = debug.getinfo(1, "S")
    local path = info.source:sub(2) -- Remove the leading '@'
    -- Match everything up to the last path separator
    return path:match("(.+[/\\])")
end
vim.cmd('source ' .. get_script_directory()  .. '/remaps.vim')

return {
    "deris/vim-shot-f",
    "ggandor/leap.nvim",
    "ggandor/flit.nvim",
    { "tenxsoydev/karen-yank.nvim", config = true },
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },
    {
        "AckslD/nvim-neoclip.lua",
        dependencies = {
          -- you'll need at least one of these
          -- {'nvim-telescope/telescope.nvim'},
          -- {'ibhagwan/fzf-lua'},
        },
        config = function()
          require('neoclip').setup()
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      }
}
