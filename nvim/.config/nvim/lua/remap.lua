vim.keymap.set("n", "<leader>n", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever paste without losing yanked
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "qq", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

--Other remaps
vim.keymap.set("n", "<leader>h", "<C-w>s")
vim.keymap.set("n", "<leader>v", "<C-w>v")
vim.keymap.set("n", "<leader>=", "<C-w> =")
vim.keymap.set("n", "<leader>x", ":close<CR>")
vim.keymap.set("n", "<leader>m", ":MaximizerToggle<CR>")

vim.keymap.set("n", "<leader>to", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")
vim.keymap.set("n", "<leader>tn", ":tabn<CR>")
vim.keymap.set("n", "<leader>tp", ":tabp<CR>")

vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>")

vim.keymap.set("n", "<leader>o", ":InspectTree<CR>")

vim.keymap.set("n", "<leader>k", ":bp<CR>", { noremap = true, silent = true, desc = "Go to [P]revious buffer" })

vim.keymap.set("n", "<leader>l", ":bn<CR>", { noremap = true, silent = true, desc = "Go to [N]ext buffer" })
