local lspconfig = vim.F.npcall(require, "lspconfig")
if not lspconfig then return end

require("mason").setup {
	PATH = "append",
}

require "user.lsp.handlers"

local nnoremap = require("user.keymap").nnoremap
local inoremap = require("user.keymap").inoremap
local vnoremap = require("user.keymap").vnoremap

local function custom_attach(_client, _bufnr)
	nnoremap("<leader>lf", vim.lsp.buf.format)

	inoremap("<C-s>", vim.lsp.buf.signature_help)

	-- Code actions
	nnoremap("<leader>lr", vim.lsp.buf.rename)
	nnoremap("<leader>la", vim.lsp.buf.code_action)
	vnoremap("<leader>la", vim.lsp.buf.range_code_action)

	-- Code Navigation
	nnoremap("gd", require("telescope.builtin").lsp_definitions)
	nnoremap("gD", vim.lsp.buf.declaration)
	nnoremap("gD", vim.lsp.buf.declaration)
	nnoremap("gr", require("telescope.builtin").lsp_references)
	nnoremap("gI", require("telescope.builtin").lsp_implementations)

	-- Docs
	nnoremap("K", vim.lsp.buf.hover)

	-- Diagnostics
	nnoremap("gl", vim.diagnostic.open_float)
	nnoremap("<leader>lj", vim.diagnostic.goto_next)
	nnoremap("<leader>lk", vim.diagnostic.goto_prev)
	nnoremap("<leader>lq", vim.diagnostic.setloclist)
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()

-- Completion configuration
updated_capabilities.textDocument.completion.completionItem.snippetSupport = true
require("cmp_nvim_lsp").update_capabilities(updated_capabilities)

require("mason-lspconfig").setup {
	ensure_installed = {
		"bashls",
		"cssls",
		"denols",
		"gopls",
		"html",
		"jsonls",
		"sqls",
		"sumneko_lua",
		"tsserver",
		"yamlls",
	},
}

require("mason-lspconfig").setup_handlers {
	function(server_name)
		lspconfig[server_name].setup {
			on_attach = custom_attach,
			capabilities = updated_capabilities,
		}
	end,
	["sumneko_lua"] = function()
		lspconfig.sumneko_lua.setup {
			on_attach = custom_attach,
			capabilities = updated_capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand "$VIMRUNTIME/lua"] = true,
							[vim.fn.stdpath "config" .. "/lua"] = true,
						},
					},
					telemetry = {
						enable = false,
					},
				},
			},
		}
	end,
	["gopls"] = function()
		lspconfig.gopls.setup {
			on_attach = custom_attach,
			capabilities = updated_capabilities,
			settings = {
				gopls = {
					gofumpt = true,
				},
			},
		}
	end,
	["tsserver"] = function()
		lspconfig.tsserver.setup {
			on_attach = function(client)
				client.server_capabilities.document_formatting = false
				custom_attach(client)
			end,
			capabilities = updated_capabilities,
			root_dir = lspconfig.util.root_pattern "package.json",
		}
	end,
	["denols"] = function()
		lspconfig.denols.setup {
			on_attach = function(client)
				client.server_capabilities.document_formatting = false
				custom_attach(client)
			end,
			capabilities = updated_capabilities,
			root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
		}
	end,
}

require("null-ls").setup {
	debug = false,
	sources = {
		require("null-ls").builtins.code_actions.refactoring,
		require("null-ls").builtins.code_actions.shellcheck,
		require("null-ls").builtins.diagnostics.checkmake,
		require("null-ls").builtins.diagnostics.shellcheck,
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.prettierd,
		require("null-ls").builtins.formatting.shfmt.with {
			extra_args = { "-i", "2", "-sr", "-s", "-ci" },
		},
	},
}

require("mason-null-ls").setup {
	ensure_installed = {
		"gofumpt",
		"shellcheck",
		"shfmt",
		"stylua",
	},
}
