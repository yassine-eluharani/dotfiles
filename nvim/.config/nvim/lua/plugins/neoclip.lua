return {
  "AckslD/nvim-neoclip.lua",
  config = function()
    require("telescope").load_extension("neoclip")
    require("neoclip").setup({
      vim.keymap.set("n", "<leader>b", ":Telescope neoclip<CR>")
    })
  end,
}
