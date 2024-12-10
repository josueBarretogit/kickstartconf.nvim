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
	opts = {
		transparent = true,
	},
}

return { catpuccin, tokyonight }
