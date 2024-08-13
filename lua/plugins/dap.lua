return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      "theHamsta/nvim-dap-virtual-text",
      { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
    },
  },

  opts = {},

  config = function()
    local masondap = require("mason-nvim-dap").setup({
      ensure_installed = { "cpptools" },
      automatic_installation = true,
      handlers = {},
    })

    local dap = require("dap")

    local dapui = require("dapui").setup()

    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "red" })
    require("nvim-dap-virtual-text").setup()
  end,

  keys = {
    {
      "<leader>dt",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "toggle breakpoint",
    },
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "continue breakpoint",
    },
    {
      "<leader>do",
      function()
        require("dap").step_over()
      end,
      desc = "step over breakpoint",
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "step into breakpoint",
    },
    {
      "<leader>ds",
      function()
        require("dap").set_breakpoint()
      end,
      desc = "set breakpoint",
    },
    {
      "<leader>du",
      function()
        require("dapui").toggle()
      end,
      desc = "toggle dapui",
    },
    {
      "<leader>de",
      function()
        require("dapui").eval()
      end,
      desc = "dapui eval",
    },
    {
      "<leader>du",
      function()
        require("dapui").toggle()
      end,
      desc = "dapui eval",
    },
  },
}
