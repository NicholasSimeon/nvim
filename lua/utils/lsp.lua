local lsp = require("lspconfig")
local cmp = require("cmp")
local luasnip = require("luasnip")
local lsps = require("list.langserver")
local linters = require("list.linters")
local formatters = require("list.formatters")

function concat(t1, t2)
  for i = 1, #t2 do
    t1[#t1 + 1] = t2[i]
  end
  return t1
end

local _on_attach = function(client, bufnr)
  local opts = {
    noremap = true,
    silent = true,
    buffer = bufnr,
  }
end

require("mason").setup()
-- debug

require("mason-lspconfig").setup({
  ensure_installed = lsps,
  automatic_installation = true,
})

local _cap = vim.lsp.protocol.make_client_capabilities()
_cap = require("cmp_nvim_lsp").default_capabilities(_cap)

_cap.textDocument.completion.completionItem.snippetSupport = true

for _, server in pairs(lsps) do
  local opts = {
    on_attach = _on_attach,
    capabilities = _cap,
  }

  server = vim.split(server, "@")[1]

  lsp[server].setup(opts)
end

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_next_item(),
    ["<Enter>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          return
        end
        cmp.confirm()
        return
      end
      fallback()
    end),
  }),

  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "luasnip" },
    { name = "vsnip" },
    --    { name = "ultisnips" },
  },

  window = {
    completion = {
      border = "rounded",
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -5,
      side_padding = 0,
    },
    documentation = { border = "rounded" },
  },
  experimental = {
    ghost_text = true,
  },
})
