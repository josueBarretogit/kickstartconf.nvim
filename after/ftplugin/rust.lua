vim.keymap.set("n", "rml", "<cmd> %s/<'a>//g <CR>", { desc = "Remove lifetimes" })

--- comments
vim.cmd(":iabbrev lcom /*<Enter>*/<Up><Enter>")
vim.cmd(":iabbrev com ///")
vim.cmd(":iabbrev res -> Result<(), Box<dyn Error>> ")
vim.cmd(":iabbrev sel -> Self")
