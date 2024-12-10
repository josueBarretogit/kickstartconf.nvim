local function map(mode, keys, actions, opts)
	local m = mode or "n"
	vim.keymap.set(m, keys, actions, opts)
end

map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<c-s>", "<cmd>w<CR>")
map("i", "jk", "<Esc>")

map("n", "<leader>q", vim.diagnostic.setloclist)

map("t", "<leader>s", "<C-\\><C-n>")
map("n", "<C-h>", "<C-w><C-h>")
map("n", "<C-l>", "<C-w><C-l>")
map("n", "<C-j>", "<C-w><C-j>")
map("n", "<C-k>", "<C-w><C-k>")
map("i", "<c-z>", "<><left>")

map("n", "<leader><leader>s", "<cmd> HopWord <CR>")
map("n", "<leader><leader>t", "<cmd> HopNodes <CR>")

map("n", "<tab>", "<cmd> bnext <CR>")
map("n", "<s-tab>", "<cmd> bprevious <CR>")
map("n", "<leader>x", "<cmd> bdelete <CR>")

map("n", "<c-d>", "<C-d>zz")
map("n", "<c-u>", "<C-u>zz")

local builtin = require("telescope.builtin")

local telescope_keymaps = {
	["<leader>b"] = {
		action = builtin.buffers,
		desc = "[ ] Find existing buffers",
	},
	["<leader>s."] = {
		action = builtin.oldfiles,
		desc = '[S]earch Recent Files ("." for repeat)',
	},
	["<leader>sr"] = {
		action = builtin.resume,
		desc = "[S]earch [R]esume",
	},
	["<leader>sd"] = {
		action = builtin.diagnostics,
		desc = "[S]earch [D]iagnostics",
	},
	["<leader>sf"] = {
		action = builtin.live_grep,
		desc = "[S]earch by [G]rep",
	},
	["<leader>sw"] = {
		action = builtin.grep_string,
		desc = "[S]earch current [W]ord",
	},
	["<leader>ss"] = {
		action = builtin.builtin,
		desc = "[S]earch [S]elect Telescope",
	},
	["<leader>f"] = {
		action = builtin.find_files,
		desc = "[S]earch [F]iles",
	},
	["<leader>sk"] = {
		action = builtin.keymaps,
		desc = "[S]earch [K]eymaps",
	},
	["<leader>sh"] = {
		action = builtin.help_tags,
		desc = "[S]earch [H]elp",
	},

	["<leader>/"] = {
		action = function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end,
		desc = "[/] Fuzzily search in current buffer",
	},
	["<leader>s/"] = {
		action = function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end,
		desc = "[S]earch [/] in Open Files",
	},
}

for shortcut, values in pairs(telescope_keymaps) do
	map("n", shortcut, values.action, { desc = values.desc })
end

-- map("n", "gd", builtin.lsp_definitions, "[G]oto [D]efinition")
-- map("n", "gr", builtin.lsp_references, "[G]oto [R]eferences")
-- map("n", "gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
-- map("n", "<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")
-- map("n", "<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
-- map("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
--
-- map("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
--
-- map("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
--
-- map("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
--
-- vim.keymap.set("n", "<leader>fl", function()
-- 	vim.diagnostic.open_float()
-- end, { desc = "Open error" })
