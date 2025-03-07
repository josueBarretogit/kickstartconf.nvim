---@type Keymap
return {
	["fd"] = {
		action = function()
			vim.cmd("FlutterDevices")
		end,
		description = "FlutterDevices",
	},
	["fr"] = {
		action = function()
			vim.cmd("FlutterRun")
		end,
		description = "Flutter run",
	},
	["fe"] = {
		action = function()
			vim.cmd("FlutterRestart")
		end,
		description = "Flutter restart",
	},
	["fq"] = {
		action = function()
			vim.cmd("FlutterQuit")
		end,
		description = "Flutter quit",
	},
}
