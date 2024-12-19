local harpoon = require("harpoon")

---@type Keymap
return {
	["<leader>ha"] = {
		action = function()
			harpoon:list():add()
		end,
		description = "Add to harpoon",
	},
	["hls"] = {
		action = function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end,
		description = "Add to harpoon",
	},
}
