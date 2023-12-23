return {
  lazy = true,
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "haydenmeade/neotest-jest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
      },
      quickfix = {
        open = function()
          if require("lazyvim.util").has("trouble.nvim") then
            require("trouble").open({ mode = "quickfix", focus = false })
          else
            vim.cmd("copen")
          end
        end,
      },
    })
    vim.keymap.set("n", "<leader>tt", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
      { desc = "Run File" })
    vim.keymap.set(
      "n",
      "<leader>tT",
      "<cmd>lua require('neotest').run.run(vim.loop.cwd())<cr>",
      { desc = "Run All Test Files" }
    )
    vim.keymap.set("n", "<leader>tr", "<cmd>lua require('neotest').run.run()<cr>", {
      desc = "Run Nearest",
    })
    vim.keymap.set(
      "n",
      "<leader>ts",
      "<cmd>lua require('neotest').summary.toggle()<cr>",
      { desc = "Toggle Summary" }
    )
    vim.keymap.set(
      "n",
      "<leader>to",
      "<cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<cr>",
      { desc = "Show Output" }
    )
    vim.keymap.set(
      "n",
      "<leader>tO",
      "<cmd>lua require('neotest').output_panel.toggle()<cr>",
      { desc = "Toggle Output Panel" }
    )
    vim.keymap.set("n", "<leader>tS", "<cmd>lua require('neotest').run.stop()<cr>", { desc = "Stop" })
  end
}
