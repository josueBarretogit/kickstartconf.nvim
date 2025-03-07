vim.keymap.set("n", "rml", "<cmd> %s/<'a>//g <CR>", { desc = "Remove lifetimes" })

--- comments
vim.cmd(":iabbrev lcom /*<Enter>*/<Up><Enter>")
vim.cmd(":iabbrev com ///")

--- for comenting functions with #[test]
local function comment_test()
	local commands = "0vjf{%gc"
	vim.cmd(":normal " .. commands)
end

vim.keymap.set("n", "<leader>ct", comment_test, { desc = "Comment test" })

require("snippets.rust")

local function open_rust_tests()
	vim.cmd("terminal")
	vim.api.nvim_chan_send(vim.bo.channel, "cargo nextest run \n")
	--- enter insert mode in the terminal
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i", true, false, false), "t", false)
end

vim.keymap.set("n", "<leader>rt", open_rust_tests, { desc = "Open cargo nextest" })
