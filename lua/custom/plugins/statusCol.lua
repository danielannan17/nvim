-- Enable both number and relativenumber by default
vim.wo.number = true
vim.wo.relativenumber = true

-- Create an autogroup for number toggling
local number_toggle = vim.api.nvim_create_augroup('NumberToggle', { clear = true })

-- Switch to absolute numbers in insert mode
vim.api.nvim_create_autocmd('InsertEnter', {
  group = number_toggle,
  callback = function()
    vim.wo.relativenumber = false
  end,
})

-- Switch back to relative numbers in normal mode
vim.api.nvim_create_autocmd('InsertLeave', {
  group = number_toggle,
  callback = function()
    vim.wo.relativenumber = true
  end,
})
return {
  'luukvbaal/statuscol.nvim',
  config = function()
    -- local builtin = require("statuscol.builtin")
    require('statuscol').setup {
      -- configuration goes here, for example:
      -- relculright = true,
      -- segments = {
      --   { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
      --   {
      --     sign = { namespace = { "diagnostic/signs" }, maxwidth = 2, auto = true },
      --     click = "v:lua.ScSa"
      --   },
      --   { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
      --   {
      --     sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
      --     click = "v:lua.ScSa"
      --   },
      -- }
    }
  end,
}
