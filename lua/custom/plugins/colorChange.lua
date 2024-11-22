-- require 'custom.plugins.colorChange'
-- Change color based on mode
vim.api.nvim_create_autocmd({"ModeChanged"}, {
    pattern = {"*:*"},
    callback = function(ev)
        local normal_bg = 'default'
        local insert_bg = '#190d1c'
        local visual_bg = '#000010'

        local mode = string.match(ev.match, ":(%a+)")

        if mode == 'n' then
            vim.api.nvim_command('hi Normal guibg=' .. normal_bg)
        elseif mode == 'i' then
            vim.api.nvim_command('hi Normal guibg=' .. insert_bg)
        elseif mode == 'V' then
            vim.api.nvim_command('hi Normal guibg=' .. visual_bg)
        end
    end
})

return {}