-- NOTE: `lazyvim.plugins` is already imported by lua/config/lazy.lua; importing
-- it a second time here was redundant.
return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },

  -- LSPConfig + TS helpers
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- `tsserver` was renamed to `ts_ls` upstream; the old name matches nothing,
      -- so both this entry and the old `setup.tsserver` hook were dead config.
      servers = { pyright = {}, ts_ls = {} },
    },
    init = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "TypeScript LSP buffer keymaps",
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client or client.name ~= "ts_ls" then
            return
          end
          -- ts_ls exposes this natively, so the archived typescript.nvim
          -- wrapper is no longer needed.
          vim.keymap.set("n", "<leader>co", function()
            vim.lsp.buf.code_action({
              context = { only = { "source.organizeImports" }, diagnostics = {} },
              apply = true,
            })
          end, { buffer = args.buf, desc = "Organize Imports" })
        end,
      })
    end,
  },

  -- Mason (formatters/linters)
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "stylua", "shellcheck", "shfmt", "flake8" },
    },
  },
}
