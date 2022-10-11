local dap = vim.F.npcall(require, "dap")
if not dap then return end

local dapui = vim.F.npcall(require, "dapui")
if not dapui then return end

local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then return end

dap_install.setup {}

dap_install.config("python", {})
-- add other configs here

dapui.setup {
	sidebar = {
		elements = {
			{
				id = "scopes",
				size = 0.25, -- Can be float or integer > 1
			},
			{ id = "breakpoints", size = 0.25 },
		},
		size = 40,
		position = "right", -- Can be "left", "right", "top", "bottom"
	},
	tray = {
		elements = {},
	},
}

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

local nnoremap = require("user.keymap").nnoremap
local opts = { silent = true }

nnoremap("<leader>db", dap.toggle_breakpoint, opts)
nnoremap("<leader>dc", dap.continue, opts)
nnoremap("<leader>di", dap.step_into, opts)
nnoremap("<leader>do", dap.step_over, opts)
nnoremap("<leader>dO", dap.step_out, opts)
nnoremap("<leader>dr", dap.repl.toggle, opts)
nnoremap("<leader>dl", dap.run_last, opts)
nnoremap("<leader>du", dapui.toggle, opts)
nnoremap("<leader>dt", dap.terminate, opts)
