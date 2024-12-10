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

map("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
map("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
map("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
map("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
map("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
map("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
map("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
map("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
map("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

map("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

map("n", "<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "[S]earch [/] in Open Files" })

map("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

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
