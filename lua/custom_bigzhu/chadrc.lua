-- Just an example, supposed to be placed in /lua/custom/

local M = {}

M.options = {
  user = function()
    -- 关闭愚蠢的自动移到上下行
    vim.opt.whichwrap = ""
    --fold
    vim.opt.foldmethod = "indent"
    --disable auto fold
    vim.opt.foldlevel = 20
    --" 输入tab 转为2个空格
    vim.opt.expandtab = true
    -- 设置制表符空格数
    vim.opt.softtabstop = 2
    -- 设置缩进空格数
    vim.opt.shiftwidth = 2
  end,
}
-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "gruvbox",
}
M.plugins = {
  override = {
    ["kyazdani42/nvim-tree.lua"] = {
      view = {
        adaptive_size = true,
        mappings = {
          list = {
            { key = "l", action = "edit" },
            { key = "h", action = "edit" },
            { key = "t", action = "edit" },
          },
        },
      },
      git = {
        enable = true,
      },

      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
  },

  user = {
    ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
        local null_ls = require "null-ls"
        local b = null_ls.builtins
        require("null-ls").setup {
          debug = true,
          sources = {
            -- Flutter/Dart
            b.formatting.dart_format.with { filetypes = { "dart" } },
            -- front
            b.formatting.prettierd.with { filetypes = { "html", "markdown", "css" } },
            b.formatting.deno_fmt.with { filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } },

            -- Lua
            b.formatting.stylua,
            b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

            -- Shell
            b.formatting.shfmt,
            b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
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
  },
}
M.mappings = {
  tabufline = {
    n = {
      -- cycle through buffers
      ["L"] = { "<cmd> Tbufnext <CR>", "  goto next buffer" },
      ["H"] = { "<cmd> Tbufprev <CR> ", "  goto prev buffer" },

      -- close buffer + hide terminal buffer
      ["<leader>c"] = {
        function()
          require("core.utils").close_buffer()
        end,
        "   close buffer",
      },
    },
  }
}
return M
