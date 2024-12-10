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

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

if vim.g.neovide then
	require("neovide")
end
