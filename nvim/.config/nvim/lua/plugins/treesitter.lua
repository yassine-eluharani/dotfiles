return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = {
		"python",
		"javascript",
		"typescript",
		"lua",
		"vim",
		"json",
		"tsx",
		"yaml",
		"html",
		"css",
		"graphql",
		"bash",
		"dockerfile",
		"gitignore",
	},
        highlight = { enable = true },
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
      })
    end
  }
}
