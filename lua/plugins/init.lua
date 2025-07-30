return {
  { import = "lazyvim.plugins" },

  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },

  -- LSPConfig + TS helpers
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { buffer = buffer, desc = "Rename File" })
        end)
      end,
    },
    opts = {
      servers = { pyright = {}, tsserver = {} },
      setup = {
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },

  -- Mason (formatters/linters)
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "stylua", "shellcheck", "shfmt", "flake8" },
    },
  },
}
