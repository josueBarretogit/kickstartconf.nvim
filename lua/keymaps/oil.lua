---@type Keymap
local oil_keymaps = {
	["<c-n>"] = {
		action = function()
			vim.cmd(":Oil")
		end,
		description = "Open parent directory",
	},
}

return oil_keymaps
