return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "j-hui/fidget.nvim"
  },

  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require("mason").setup({})
    require("fidget").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        "tsserver",
        "jsonls",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "emmet_ls",
        "pyright",
        "rust_analyzer",
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }
                }
              }
            }
          }
        end,

      },
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          local opts = { buffer = ev.buf }
          local keymap = vim.keymap
          -- set keybinds
          opts.desc = "[G]oto [R]eferences"
          keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

          opts.desc = "[G]oto [D]eclaration"
          keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

          opts.desc = "[G]oto [D]efinition"
          keymap.set("n", "gd", vim.lsp.buf.definition, opts)

          opts.desc = "[G]oto [I]mplementation"
          keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

          opts.desc = "Type [D]efinition"
          keymap.set("n", "<leader>td", "<cmd>Telescope lsp_type_definitions<CR>", opts)

          opts.desc = "See available code actions"
          keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

          opts.desc = "Smart rename"
          keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

          opts.desc = "Show buffer diagnostics"
          keymap.set("n", "<leader>xx", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

          opts.desc = "Show line diagnostics"
          keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)

          opts.desc = "Show documentation for what is under cursor"
          keymap.set("n", "K", vim.lsp.buf.hover, opts)

          opts.desc = "Signature Documentation"
          keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

          opts.desc = "Restart LSP"
          keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
        end,
      }),
    })
    -- Format on save
    vim.api.nvim_create_autocmd('BufWritePre', {
      callback = function()
        vim.lsp.buf.format {
          async = false,
        }
      end,
    })
    local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
  end,
}
