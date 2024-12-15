---@class KeymapInfo
---@field action any
---@field description string
local KeymapInfo = {}

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

---@type Keymap
local terminal_mode = {
	["<Esc><Esc>"] = {
		action = "<C-\\><C-n>",
		description = "Escape terminal mode ",
	},
}

setup_keymaps(terminal_mode, "t")

---@type Keymap
local window_keymaps = {
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

setup_keymaps(window_keymaps)

local builtin = require("telescope.builtin")

---@type Keymap
local telescope_keymaps = {
	["<leader>b"] = {
		action = builtin.buffers,
		description = "[ ] Find existing buffers",
	},
	["<leader>s."] = {
		action = builtin.oldfiles,
		description = '[S]earch Recent Files ("." for repeat)',
	},
	["<leader>sr"] = {
		action = builtin.resume,
		description = "[S]earch [R]esume",
	},
	["<leader>sd"] = {
		action = builtin.diagnostics,
		description = "[S]earch [D]iagnostics",
	},
	["<leader>sf"] = {
		action = builtin.live_grep,
		description = "[S]earch by [G]rep",
	},
	["<leader>sw"] = {
		action = builtin.grep_string,
		description = "[S]earch current [W]ord",
	},
	["<leader>ss"] = {
		action = builtin.builtin,
		description = "[S]earch [S]elect Telescope",
	},
	["<leader>f"] = {
		action = builtin.find_files,
		description = "[S]earch [F]iles",
	},
	["<leader>sk"] = {
		action = builtin.keymaps,
		description = "[S]earch [K]eymaps",
	},
	["<leader>sh"] = {
		action = builtin.help_tags,
		description = "[S]earch [H]elp",
	},

	["<leader>/"] = {
		action = function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end,
		description = "[/] Fuzzily search in current buffer",
	},
	["<leader>s/"] = {
		action = function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end,
		description = "[S]earch [/] in Open Files",
	},
}

setup_keymaps(telescope_keymaps)

---@type Keymap
local hop_words = {
	["<leader>e"] = {
		action = "<cmd> HopWord <CR>",
		description = "Hop words",
	},
}

setup_keymaps(hop_words)

map("n", "<c-d>", "<C-d>zz")
map("n", "<c-u>", "<C-u>zz")
map("n", "<leader>q", vim.diagnostic.setloclist)
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<c-s>", "<cmd>w<CR>")
map("i", "jk", "<Esc>")
map("n", "<C-h>", "<C-w><C-h>")
map("i", "<c-z>", "<><left>")
map("n", "<leader>te", "<cmd> terminal <CR>", { desc = "Open terminal" })
