-- Define window types and their conditions
local window_mappings = {}

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
local toggle_key = "<leader>ac"
return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {
      terminal = {
        ---@module "snacks"
        ---@type snacks.win.Config|{}
        snacks_win_opts = {
          position = "float",
          width = 0.9,
          height = 0.9,
          keys = {
            claude_hide = {
              toggle_key,
              function(self) self:hide() end,
              mode = "t",
              desc = "Hide",
            },
          },
        },
      },
    },
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { toggle_key, "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
}
