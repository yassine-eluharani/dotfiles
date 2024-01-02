return {
	"stevearc/aerial.nvim",
	opts = function()
		---@type table<string, string[]>|false
		local filter_kind = false
		local opts = {
			attach_mode = "global",
			backends = { "lsp", "treesitter", "markdown", "man" },
			show_guides = true,
			layout = {
				max_width = { 40, 0.2 },
				width = nil,
				min_width = 10,
				win_opts = {},
				default_direction = "prefer_right",
				placement = "window",
				resize_to_content = true,
				preserve_equality = false,
			},
			--filter_kind = filter_kind,
			filter_kind = {
				"Array",
				"Class",
				"Constructor",
				"Enum",
				"Event",
				"Field",
				"File",
				"Function",
				"Interface",
				"Method",
				"Module",
				"Namespace",
				"Null",
				"Object",
				"Package",
				"Struct",
				"TypeParameter",
				"Variable",
			},
      -- stylua: ignore
      guides = {
        mid_item   = "├╴",
        last_item  = "└╴",
        nested_top = "│ ",
        whitespace = "  ",
      },
		}
		return opts
	end,
	keys = {
		{ "<leader>cs", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
	},
}
