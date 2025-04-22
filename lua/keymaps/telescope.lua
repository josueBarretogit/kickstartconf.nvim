local builtin = require("telescope.builtin")

---@type Keymap
return {
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
		action = function()
			builtin.find_files({ hidden = true })
		end,
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
