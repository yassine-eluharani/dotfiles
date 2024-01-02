return {
	"github/copilot.vim",
	config = function()
		vim.keymap.set("i", "<C-l>", "<Plug>(copilot-accept-word)")
		vim.keymap.set("i", "<C-c>", "<Plug>(copilot-dismiss)")
		vim.keymap.set("i", "<C-)>", "<Plug>(copilot-next)")
		vim.keymap.set("i", "<C-(>", "<Plug>(copilot-previous)")
		vim.keymap.set("i", "<C-s>", "<Plug>(copilot-suggest)")
	end,
}
