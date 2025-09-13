return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",       -- core debugging
    "nvim-neotest/nvim-nio",       -- async lib required by dap-ui
    "theHamsta/nvim-dap-virtual-text", -- (optional) inline variable values
  }
}
