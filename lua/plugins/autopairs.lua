return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = { "hrsh7th/nvim-cmp" },
	opts = {
		disable_in_macro = true,
		disable_in_visualblock = true,
		disable_in_replace_mode = true,
	},
}
