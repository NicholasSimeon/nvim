return {

  "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
  lazy = false,           -- REQUIRED: tell lazy.nvim to start this plugin at startup
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-vsnip",
    "L3MON4D3/LuaSnip",
    "dcampos/cmp-snippy",
  },
  config = function() end,
}
