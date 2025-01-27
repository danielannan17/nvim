-- Define window types and their conditions
local window_mappings = {
  ["avante"] = {
    ["<leader>aa"] = {
      action = function() vim.cmd("AvanteChat'") end,
      desc = "Find file in avante"
    },
    ["<leader>q"] = {
      action = function() vim.cmd("Neotree close") end,
      desc = "Close neo-tree window"
    },
  },
    ["aider"] = {
    ["<leader>f"] = {
      action = function() vim.cmd("echo 'terminal find'") end,
      desc = "Find in terminal"
    },
    ["<leader>q"] = {
      action = function() vim.cmd("hide") end,
      desc = "Hide terminal window"
    },
  },
  ["default"] = {
    ["<leader>av"] = {
      action = function() vim.cmd("AvanteChat") end,
      desc = "Find files with Telescope"
    },
    ["<leader>ai"] = {
      action = function() vim.cmd("AiderTerminalToggle") end,
      desc = "Quit window"
    },
  },
}

-- Update the apply_window_mappings function to use the new format
-- local function apply_window_mappings()
--   -- Clear existing mappings
--   for _, mappings in pairs(window_mappings) do
--     for key, _ in pairs(mappings) do
--       pcall(vim.keymap.del, 'n', key, {buffer = true})
--     end
--   end

--   -- Determine window type
--   local current_type = "default"
--   for wtype, condition in pairs(window_types) do
--     if condition() then
--       current_type = wtype
--       break
--     end
--   end

--   -- Apply new mappings with descriptions
--   for key, mapping in pairs(window_mappings[current_type]) do
--     vim.keymap.set('n', key, mapping.action, {
--       buffer = true,
--       desc = mapping.desc
--     })
--   end
-- end

-- -- Set up autocommand to update mappings
-- vim.api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {
--   pattern = "*",
--   callback = apply_window_mappings
-- })

return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      -- add any opts here
      behaviour = {
        -- auto_set_keymaps = false,
      },
      mappings = {
        ---@class AvanteConflictMappings
        diff = {
          ours = "co",
          theirs = "ct",
          all_theirs = "ca",
          both = "cb",
          cursor = "cc",
          next = "]x",
          prev = "[x",
        },
        suggestion = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
        jump = {
          next = "]]",
          prev = "[[",
        },
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        -- NOTE: The following will be safely set by avante.nvim
        ask = "<leader>avc",
        edit = "<leader>ave",
        refresh = "<leader>avr",
        focus = "<leader>avf",
        toggle = {
          default = "<leader>avt",
          debug = "<leader>avd",
          hint = "<leader>avh",
          suggestion = "<leader>avs",
          repomap = "<leader>avR",
        },
        sidebar = {
          apply_all = "A",
          apply_cursor = "a",
          switch_windows = "<Tab>",
          reverse_switch_windows = "<S-Tab>",
          remove_file = "d",
          add_file = "@",
        },
        files = {
          add_current = "<leader>ava", -- Add current buffer to selected files
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "GeorgesAlkhouri/nvim-aider",
    cmd = {
      "AiderTerminalToggle",
      "AiderHealth",
    },
    keys = {
      { "<leader>aia", "<cmd>AiderQuickAddFile<CR>", desc = "Add file to aider" },
      { "<leader>aid", "<cmd>AiderQuickDropFile<CR>", desc = "Drop file" },
      { "<leader>air", "<cmd>AiderQuickReadOnlyFile<CR>", desc = "Add file read only" },
      { "<leader>ail", "<cmd>AiderQuickSendCommand<CR>", desc = "List aider commands" },
      { "<leader>aic", "<cmd>AiderTerminalSend<CR>", desc = "Chat with aider" },
    },
    dependencies = {
      "folke/snacks.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
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
}