return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = {
					"vimdoc",
					"python",
					"javascript",
					"typescript",
					"lua",
					"json",
					"tsx",
					"yaml",
					"html",
					"css",
					"bash",
					"dockerfile",
					"gitignore",
				},
				highlight = {
					enable = true,
				},
				indent = { enable = true },

				autotag = { enable = true },
				auto_install = true,
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["ii"] = "@conditional.inner",
							["ai"] = "@conditional.outer",
							["il"] = "@loop.inner",
							["al"] = "@loop.outer",
							["at"] = "@comment.outer",
						},
					},
				},
			})
		end,
	},
}
