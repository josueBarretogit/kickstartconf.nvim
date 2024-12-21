---@class KeymapInfo
---@field action any
---@field description string
KeymapInfo = {}

---@alias Keymap {[string] : KeymapInfo }

local function map(mode, keys, actions, opts)
	local m = mode or "n"
	vim.keymap.set(m, keys, actions, opts)
end

---@param keymaps Keymap
---@param mode any | nil
local function setup_keymaps(keymaps, mode)
	local m = mode or "n"
	for shortcut, values in pairs(keymaps) do
		map(m, shortcut, values.action, { desc = values.description })
	end
end

map("i", "<c-z>", "<><left>")
map("i", "jk", "<Esc>")

---@type Keymap
local terminal_mode = {
	["<Esc><Esc>"] = {
		action = "<C-\\><C-n>",
		description = "Escape terminal mode",
	},
}

setup_keymaps(terminal_mode, "t")

--- load modules in ./keymaps/*.lua
for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/keymaps")) do
	local formated_module = file:gsub("%.lua$", "")
	setup_keymaps(require("keymaps." .. formated_module))
end
