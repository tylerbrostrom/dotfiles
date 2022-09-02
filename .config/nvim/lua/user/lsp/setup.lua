local lspconfig = require "lspconfig"

local Keymap = require "user.keymap"
local nnoremap, vnoremap = Keymap.nnoremap, Keymap.vnoremap

-- Configure diagnostics
local function configure_diagnostics()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = false,
    signs = {
      active = signs, -- show signs
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)
end

local function set_keymaps()
  nnoremap("<leader>lf", vim.lsp.buf.formatting)

  -- Code actions
  nnoremap("<leader>lr", vim.lsp.buf.rename)
  nnoremap("<leader>la", vim.lsp.buf.code_action)
  vnoremap("<leader>la", vim.lsp.buf.range_code_action)

  -- Movement
  nnoremap("gD", vim.lsp.buf.declaration)
  nnoremap("gr", function() require("telescope.builtin").lsp_references() end)
  nnoremap("gd", function() require("telescope.builtin").lsp_definitions() end)
  nnoremap("gI", function() require("telescope.builtin").lsp_implementations() end)

  -- Docs
  nnoremap("K", vim.lsp.buf.hover)
  nnoremap("<leader>ls", vim.lsp.buf.signature_help)

  -- Diagnostics
  nnoremap("gl", vim.diagnostic.open_float)
  nnoremap("<leader>lj", vim.diagnostic.goto_next)
  nnoremap("<leader>lk", vim.diagnostic.goto_prev)
  nnoremap("<leader>lq", vim.diagnostic.setloclist)

end

local function on_attach(client)
  -- if client.name == "tsserver" then
  --   client.resolved_capabilities.document_formatting = false
  -- end
  --
  -- if client.name == "sumneko_lua" then
  --   client.resolved_capabilities.document_formatting = false
  -- end

  set_keymaps()

  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end


local function create_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return require("cmp_nvim_lsp").update_capabilities(capabilities)
end



configure_diagnostics()

require("mason-lspconfig").setup {
  ensure_installed = {
    "sumneko_lua",
    "cssls",
    "html",
    "tsserver",
    "denols",
    "gopls",
    "sqls",
    "bashls",
    "jsonls",
    "yamlls",
  }
}

require("mason-lspconfig").setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      capabilities = create_capabilities(),
    }
  end,
  ["sumneko_lua"] = function()
    lspconfig.sumneko_lua.setup {
      on_attach = on_attach,
      capabilities = create_capabilities(),
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
      }
    }
  end,
  ["tsserver"] = function()
    lspconfig.tsserver.setup {
      on_attach = on_attach,
      capabilities = create_capabilities(),
      root_dir = lspconfig.util.root_pattern("package.json")
    }
  end,
  ["denols"] = function()
    lspconfig.denols.setup {
      on_attach = on_attach,
      capabilities = create_capabilities(),
      root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
    }
  end
}
