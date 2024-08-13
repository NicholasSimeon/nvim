return {
  "frenzyexists/aquarium-vim",
  priority = 1000,
  lazy = false,
  config = function(plugin)
    --require("aquarium").setup()
    vim.cmd([[colorscheme aquarium]])
  end,
}
