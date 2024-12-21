vim.keymap.set("n", "rml", "<cmd> %s/<'a>//g <CR>", { desc = "Remove lifetimes" })

--- comments
vim.cmd(":iabbrev lcom /*<Enter>*/<Up><Enter>")
vim.cmd(":iabbrev com ///")

local function comment_test()
	local commands = "vjf{%gc"
	vim.cmd(":normal " .. commands)
end

vim.keymap.set("n", "<leader>ct", comment_test, { desc = "Comment test" })

require("snippets.rust")
