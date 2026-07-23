-- gh-dash (https://www.gh-dash.dev) in a floating snacks terminal
local toggle_key = '<C-,>'

local function toggle()
  require('snacks').terminal.toggle('gh dash', {
    win = {
      position = 'float',
      width = 0.9,
      height = 0.9,
      border = 'rounded',
      title = ' gh dash ',
      title_pos = 'center',
      keys = {
        gh_dash_hide = {
          toggle_key,
          function(self) self:hide() end,
          mode = 't',
          desc = 'Hide',
        },
      },
    },
  })
end

return {
  'folke/snacks.nvim',
  keys = {
    { '<leader>gd', toggle, desc = 'gh-dash' },
    { toggle_key, toggle, desc = 'gh-dash', mode = { 'n', 'x' } },
  },
}
