local M = {}

local autopairs = {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = { "hrsh7th/nvim-cmp" },
	opts = {
		disable_in_macro = true,
		disable_in_visualblock = true,
		disable_in_replace_mode = true,
	},
}

local gitsigns = {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
	},
}

local plugins = {
	"tpope/vim-sleuth",
	gitsigns,
	autopairs,
	require("plugins.whichkey"),
	require("plugins.lspconfiguration"),
	require("plugins.telescopeconf"),
	require("plugins.themes"),
	require("plugins.mini"),
	require("plugins.treesitter"),
	require("plugins.conform"),
	require("plugins.cmp"),
	require("plugins.neotree"),
	require("plugins.bufferline"),

	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },

	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{
		"chrisgrieser/nvim-various-textobjs",
		event = "VeryLazy",
		opts = { useDefaultKeymaps = true },
	},
	{
		"smoka7/hop.nvim",
		version = "*",
		opts = {
			keys = "etovxqpdygfblzhckisuran",
		},
	},
}

local ui_options = {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
}

M.plugins = plugins

M.ui_options = ui_options

return M
