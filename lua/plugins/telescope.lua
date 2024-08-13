return {
  "nvim-telescope/telescope.nvim",

  lazy = false,
  dependencies = {
    { "nvim-lua/plenary.nvim",                      lazy = false },
    { "nvim-telescope/telescope-file-browser.nvim", lazy = false },
    { "nvim-telescope/telescope-frecency.nvim",     lazy = false },
  },
  keys = {
    {
      "<leader>tf",
      "<cmd>Telescope fd<cr>",
      desc = "find files telescope",
    },
    { "<leader>fb", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "filebrowser" },
    { "<leader>fr", "<cmd>Telescope frecency workspace=CWD",                         desc = "telescope frqeuncy" },
  },
}
