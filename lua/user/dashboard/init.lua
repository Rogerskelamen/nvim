-- vim.g.dashboard_default_executive = 'fzf'
local home = os.getenv('HOME')
local db = require('dashboard')
db.preview_command = 'cat | lolcat -F 0.3'
-- db.custom_header = {
	-- '',
	-- '███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
	-- '████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
	-- '██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
	-- '██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
	-- '██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
	-- '╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
	-- '',
	-- '',
-- }
db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
db.preview_file_height = 11
db.preview_file_width = 70
db.custom_center = {
  {icon = '  ',
  desc = 'Recently opened files                   ',
  action =  'History',
  shortcut = 'LEADER f h'},
  {icon = '  ',
  desc = 'Find  File                              ',
  action = 'Files',
  shortcut = 'LEADER f f'},
  {icon = '  ',
  desc = 'File Browser                            ',
  action =  'RnvimrToggle',
  shortcut = 'LEADER r g'},
  {icon = '  ',
  desc = 'Find  word                              ',
  action = 'Ag',
  shortcut = 'LEADER f w'},
  {icon = '  ',
  desc = 'Open Personal dotfiles                  ',
  action = 'e ~/.config',
  shortcut = 'LEADER f d'},
}
-- db.custom_footer = function()
    -- local footer = {'', '  Have fun with neovim'}
    -- if packer_plugins ~= nil then
        -- local count = #vim.tbl_keys(packer_plugins)
        -- footer[2] = '  neovim loaded ' .. count .. ' plugins'
        -- for key, value in pairs(packer_plugins) do
            -- table.insert(footer, '✨  ' .. key)
        -- end
    -- end

    -- print(footer)
    -- return footer
-- end
