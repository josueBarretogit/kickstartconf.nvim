---@type Keymap
return {
	["<C-k>"] = {
		action = "<C-w><C-k>",
		description = "move down windo",
	},
	["<C-j>"] = {
		action = "<C-w><C-j>",
		description = "Move up window",
	},
	["<C-l>"] = {
		action = "<C-w><C-l>",
		description = "Move rigt window",
	},
	["<leader>x"] = {
		action = "<cmd> bdelete <CR>",
		description = "Delete current tab",
	},
	["<s-tab>"] = {
		action = "<cmd> bprevious <CR>",
		description = "Previous tab",
	},
	["<tab>"] = {
		action = "<cmd> bnext <CR>",
		description = "Next tab",
	},
	["<M-h>"] = {
		action = "<cmd>vertical resize +10<cr>",
		description = "Decrease Window Width",
	},
	["<M-l>"] = {
		action = "<cmd>vertical resize -10<cr>",
		description = "Increase Window Width",
	},
	["<M-j>"] = {
		action = "<cmd>resize -10<cr>",
		description = "Decrease Window Height",
	},
	["<M-k>"] = {
		action = "<cmd>resize +10<cr>",
		description = "Increase Window Height",
	},
}
