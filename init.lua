--[[
--
--Order of exectuion: 
--* options to set <leader>
--* lazyconf to setup plugins
--* keymaps after plugins 
--
--neovide and autocmds can be at last
--]]
require("options")

require("lazyconf")

require("keymaps")

require("autocmd")

require("abbreviations")

if vim.g.neovide then
	require("neovide")
end
