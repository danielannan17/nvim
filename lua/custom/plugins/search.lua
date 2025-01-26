return {
  {
    "isak102/telescope-git-file-history.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      vim.keymap.set('n', '<leader>gh', "<cmd>Telescope git_file_history<cr>", { desc = 'Open git file history' })
    end
  },

  -- vs code like search and replace 
  {
    'MagicDuck/grug-far.nvim',
    config = function()
      require('grug-far').setup({
        -- options, see Configuration section below
        wrap = false,
        -- there are no required options atm
        -- engine = 'ripgrep' is default, but 'astgrep' can be specified
      })
      
      -- Move these keymaps into the config
      vim.keymap.set('n', '<leader>fx', function()
        vim.cmd('GrugFar')
    end, { desc = 'VS Code like search and replace' })    end
  },

  -- Add egrepify as a proper plugin spec
  {
    'fdschmidt93/telescope-egrepify.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    event = "VeryLazy",  -- Make sure it loads after everything
    config = function()
      if vim.fn.executable "rg" == 1 then
        vim.keymap.set('n', '<leader>fw', "<cmd>lua require('telescope').extensions.egrepify.egrepify()<CR>", { desc = 'Find words' })
        vim.keymap.set('n', '<leader>fW', "<cmd>lua require('telescope.builtin').live_grep({additional_args = function(args) return vim.list_extend(args, { '--hidden', '--no-ignore' }) end})<CR>", { desc = 'Find words in all files' })
      end
    end
  },
  {
    "debugloop/telescope-undo.nvim",
    dependencies = { -- note how they're inverted to above example
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    -- keys = {
    --   { -- lazy style key map
    --     "<leader>su",
    --     "<cmd>Telescope undo<cr>",
    --     desc = "undo history",
    --   },
    -- },
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
}