---@type Keymap
return {
	["<C-c>"] = {
		action = "<cmd>%y+<CR>",
		description = "general copy whole file",
	},
	["<Esc>"] = {
		action = "<cmd>nohlsearch<CR>",
		description = "Disable search highlight",
	},

	["<c-s>"] = {
		action = "<cmd>w<CR>",
		description = "save",
	},
	["<c-u>"] = {
		action = "<C-u>zz",
		description = "Better ctrl d",
	},
	["<c-d>"] = {
		action = "<C-d>zz",
		description = "Better ctrl d",
	},
}
