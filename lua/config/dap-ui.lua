local dap = require("dap")
local dapui = require("dapui")

-- Setup UI
-- dapui.setup()

-- Auto open/close dap-ui panels
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dap.adapters.coreclr = {
  type = "executable",
  command = "C:/Users/orope/.local/vsdbg/vsdbg.exe",
  args = { "--interpreter=vscode" }
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "Attach to IIS Express",
    request = "attach",
    processId = require("dap.utils").pick_process,
  },
}
