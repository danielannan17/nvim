vim.keymap.set(
  "n",
  "<leader>sf",
  "<cmd>call sidebar#toggle('neo_tree_filesystem')<CR>",
  { desc = "Open git status sidebar" }
)
vim.keymap.set(
  "n",
  "<leader>sg",
  "<cmd>call sidebar#toggle('neo_tree_git_status')<CR>",
  { desc = "Open git status sidebar" }
)
vim.keymap.set("n", "<leader>ss", "<cmd>call sidebar#toggle('grugfar')<CR>", { desc = "Open search sidebar" })
vim.keymap.set("n", "<leader>sb", "<cmd>call sidebar#toggle('neo_tree_buffers')<CR>", { desc = "Open buffers sidebar" })
vim.keymap.set("n", "<leader>ait", "<cmd>call sidebar#toggle('aider')<CR>", { desc = "Toggle aider terminal" })
vim.keymap.set("n", "<leader>tt", "<cmd>call sidebar#toggle('toggleterm')<CR>", { desc = "Toggle toggleterm" })
return {
  {
    "brglng/vim-sidebar-manager",
    config = function()
      -- Create a module-level variable to store the instance name
      local M = {}
      _G.grugfar_sidebar_instance = nil

      vim.cmd [[
            let g:sidebar = {}  " Initialize the dictionary first

            let g:sidebar.grugfar = #{
            \   position: 'left',
            \   filter: {nr -> getwinvar(nr, '&filetype') ==# 'grug-far'},
            \   open: 'lua require("my_grugfar_helper").toggle_open()',
            \   close: 'lua require("my_grugfar_helper").close()',
            \   width: 60,
            \ }

            let g:sidebar.neo_tree_filesystem = #{
            \   position: 'left',
            \   filter: {nr -> getwinvar(nr, '&filetype') ==# 'neo-tree' && winbufnr(nr)->getbufvar('neo_tree_source') ==# 'filesystem'},
            \   open: 'Neotree filesystem reveal',
            \   close: 'Neotree close',
            \   dont_close: 'neo_tree_.*'
            \ }
            let g:sidebar.neo_tree_buffers = #{
            \   position: 'left',
            \   filter: {nr -> getwinvar(nr, '&filetype') ==# 'neo-tree' && winbufnr(nr)->getbufvar('neo_tree_source') ==# 'buffers'},
            \   open: 'Neotree buffers reveal',
            \   close: 'Neotree close',
            \   dont_close: 'neo_tree_.*'
            \ }
            let g:sidebar.neo_tree_git_status = #{
            \   position: 'left',
            \   filter: {nr -> getwinvar(nr, '&filetype') ==# 'neo-tree' && winbufnr(nr)->getbufvar('neo_tree_source') ==# 'git_status'},
            \   open: 'Neotree git_status reveal',
            \   close: 'Neotree close',
            \   dont_close: 'neo_tree_.*'
            \ }
            let g:sidebar.neo_tree_document_symbols = #{
            \   position: 'left',
            \   filter: {nr -> getwinvar(nr, '&filetype') ==# 'neo-tree' && winbufnr(nr)->getbufvar('neo_tree_source') ==# 'document_symbols'},
            \   open: 'Neotree document_symbols reveal',
            \   close: 'Neotree close',
            \   dont_close: 'neo_tree_.*'
            \ }

          ]]

      -- Create a helper module to handle the instance management
      local helper = {}

      function helper.toggle_open()
        if not _G.grugfar_sidebar_instance then
          -- First time opening - create new instance

          _G.grugfar_sidebar_instance = require("grug-far").open { instanceName = "sidebar" }
          --   print("Created new grug-far instance: " .. _G.grugfar_sidebar_instance)
        else
          -- Reuse existing instance
          --   print("Reusing grug-far instance: " .. _G.grugfar_sidebar_instance)
          require("grug-far").open_instance(_G.grugfar_sidebar_instance)
        end
      end

      function helper.close()
        -- print("Closing grug-far instance: " .. _G.grugfar_sidebar_instance)
        require("grug-far").close_instance(_G.grugfar_sidebar_instance)
      end

      -- Make the helper available globally
      package.loaded["my_grugfar_helper"] = helper
    end,
  },
  "mbbill/undotree",
}
