return {
  "nvimtools/none-ls.nvim",
  lazy = false,
  config = function()
    local null = require("null-ls")

    null.setup({
      sources = {
        null.builtins.diagnostics.cppcheck,
        null.builtins.formatting.clang_format,
        null.builtins.formatting.cmake_format,
        null.builtins.formatting.stylua,
        null.builtins.completion.spell,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })
  end,
}
