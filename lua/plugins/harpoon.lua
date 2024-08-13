return {
  "ThePrimeagen/harpoon",

  opts = {},

  keys = {
    {
      "<leader>ha",
      function()
        require("harpoon.mark").add_file()
      end,
      desc = "Add Harpoon File",
    },
    {
      "<leader>ht",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "Goto Harpoon File (1)",
    },
    {
      "<leader>h1",
      function()
        require("harpoon.ui").nav_file(1)
      end,
      desc = "Goto Harpoon File (1)",
    },
    {
      "<leader>h2",
      function()
        require("harpoon.ui").nav_file(2)
      end,
      desc = "Goto Harpoon File (2)",
    },
    {
      "<leader>h3",
      function()
        require("harpoon.ui").nav_file(3)
      end,
      desc = "Goto Harpoon File (3)",
    },
    {
      "<leader>h4",
      function()
        require("harpoon.ui").nav_file(4)
      end,
      desc = "Goto Harpoon File (4)",
    },
  },
}
