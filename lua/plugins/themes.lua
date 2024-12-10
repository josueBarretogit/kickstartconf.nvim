local catpuccin = {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	init = function()
		-- vim.cmd.colorscheme("catppuccin")
	end,
	opts = {
		transparent_background = true,
	},
}

local tokyonight = {
	"folke/tokyonight.nvim",
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("tokyonight-storm")
	end,
	---@class tokyonight.Config
	opts = {
		transparent = true,

		styles = {

			sidebars = "transparent",
			floats = "transparent",
		},
	},
}

return { catpuccin, tokyonight }
