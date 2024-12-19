local function go_to_terminal_buffer()
	local buffers = vim.api.nvim_list_bufs()
	for _, bufid in pairs(buffers) do
		local bufname = vim.api.nvim_buf_get_name(bufid)
		if string.find(bufname, "term://") ~= nil then
			vim.cmd("buffer " .. bufid)
		end
	end
end

---@type Keymap
return {
	["<leader>gt"] = {
		action = function()
			go_to_terminal_buffer()
		end,
		description = "Go to terminal buffer",
	},
}
