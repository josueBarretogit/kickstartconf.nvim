return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = { "folke/lazydev.nvim", "mikavilpas/blink-ripgrep.nvim", { "L3MON4D3/LuaSnip", version = "v2.*" } },

	-- use a release tag to download pre-built binaries
	version = "v0.*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		snippets = {
			expand = function(snippet)
				require("luasnip").lsp_expand(snippet)
			end,
			active = function(filter)
				if filter and filter.direction then
					return require("luasnip").jumpable(filter.direction)
				end
				return require("luasnip").in_snippet()
			end,
			jump = function(direction)
				require("luasnip").jump(direction)
			end,
		},
		keymap = {
			["<Enter>"] = { "select_and_accept" },
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },

			["<C-l>"] = { "snippet_forward", "fallback" },
			["<c-h>"] = { "snippet_backward", "fallback" },

			-- ["<Tab>"] = {
			-- 	function(cmp)
			-- 		if cmp.snippet_active() then
			-- 			return cmp.accept()
			-- 		else
			-- 			return cmp.select_and_accept()
			-- 		end
			-- 	end,
			-- 	"snippet_forward",
			-- 	"fallback",
			-- },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },

			["<s-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },

			["<C-p>"] = { "select_prev", "fallback" },

			["<c-g>"] = {
				function()
					-- invoke manually, requires blink >v0.7.6
					require("blink-cmp").show({ sources = { "ripgrep" } })
				end,
			},
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer", "lazydev", "ripgrep" },
			-- cmdline = {},
		},

		providers = {
			lsp = { fallback_for = { "lazydev" } },
			lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },

			ripgrep = {
				module = "blink-ripgrep",
				name = "Ripgrep",
				-- the options below are optional, some default values are shown
				---@module "blink-ripgrep"
				---@type blink-ripgrep.Options
				opts = {
					-- For many options, see `rg --help` for an exact description of
					-- the values that ripgrep expects.

					-- the minimum length of the current word to start searching
					-- (if the word is shorter than this, the search will not start)
					prefix_min_len = 3,

					-- The number of lines to show around each match in the preview
					-- (documentation) window. For example, 5 means to show 5 lines
					-- before, then the match, and another 5 lines after the match.
					context_size = 5,

					-- The maximum file size of a file that ripgrep should include in
					-- its search. Useful when your project contains large files that
					-- might cause performance issues.
					-- Examples:
					-- "1024" (bytes by default), "200K", "1M", "1G", which will
					-- exclude files larger than that size.
					max_filesize = "1M",

					-- (advanced) Any additional options you want to give to ripgrep.
					-- See `rg -h` for a list of all available options. Might be
					-- helpful in adjusting performance in specific situations.
					-- If you have an idea for a default, please open an issue!
					--
					-- Not everything will work (obviously).
					additional_rg_options = {},
				},
			},
		},
		-- experimental signature help support
		-- signature = { enabled = true }
	},
}
