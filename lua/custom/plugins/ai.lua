return {
  {
    "GeorgesAlkhouri/nvim-aider",
    cmd = {
      "AiderTerminalToggle",
      "AiderHealth",
    },
    keys = {
      { "<leader>aa", "<cmd>AiderQuickAddFile<CR>", desc = "Add file to aider" },
      { "<leader>ad", "<cmd>AiderQuickDropFile<CR>", desc = "Drop file" },
      { "<leader>ar", "<cmd>AiderQuickReadOnlyFile<CR>", desc = "Add file read only" },
      { "<leader>al", "<cmd>AiderQuickSendCommand<CR>", desc = "List aider commands" },
      { "<leader>ac", "<cmd>AiderTerminalSend<CR>", desc = "Chat with aider" },
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