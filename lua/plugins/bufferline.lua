return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				style_preset = bufferline.style_preset.no_bold,
				numbers = "ordinal",
				diagnostics = "nvim_lsp",
			},
		})
	end,
}
