return {
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("null-ls").setup {
        debug = true,
        -- format on save
        --on_attach = function(client)
        --  if client.server_capabilities.document_formatting then
        --    vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ bufnr = bufnr })"
        --  end
        --end,

        sources = {
          require("null-ls").builtins.formatting.dart_format,
          require("null-ls").builtins.formatting.stylua,
          require("null-ls").builtins.diagnostics.eslint,
          require("null-ls").builtins.completion.spell,
        },
        -- format on save
        on_attach = function()
          -- for 0.8.0 nvim
          vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ bufnr = bufnr })"
          --vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
        end,
      }
    end,
  },
}

-- load it after nvim-lspconfig cuz we lazy loaded lspconfig
-- [LSP] Accessing client.resolved_capabilities is deprecated, update your plugins or configuration to access client.server_capabilities instead.The new key/value pairs in server_capabilities directly match
