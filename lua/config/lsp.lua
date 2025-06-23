local vim = vim

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts)

  if client.name == "ruff" then
    vim.keymap.set("n", "<leader>co", function()
      vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
    end, bufopts)
  end
end

local lsp_augroup = vim.api.nvim_create_augroup("lsp-config-group", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_augroup,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    on_attach(client, args.buf)
    if client and client.name == "ruff" then
      client.server_capabilities.hoverProvider = false
    end
  end,
})

vim.lsp.config("clangd", {
  keys = { { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" } },
  root_dir = function(fname)
    -- ADD THIS GUARD CLAUSE
    if type(fname) ~= "string" then
      return nil
    end

    return require("lspconfig.util").root_pattern(
      "Makefile", "configure.ac", "configure.in", "config.h.in",
      "meson.build", "meson_options.txt", "build.ninja"
    )(fname)
      or require("lspconfig.util").root_pattern(
        "compile_commands.json", "compile_flags.txt"
      )(fname)
      or require("lspconfig.util").find_git_ancestor(fname)
  end,
  capabilities = { offsetEncoding = { "utf-16" } },
  cmd = {
    "clangd", "--background-index", "--clang-tidy",
    "--header-insertion=iwyu", "--completion-style=detailed",
    "--function-arg-placeholders", "--fallback-style=llvm",
  },
  init_options = { usePlaceholders = true, completeUnimported = true, clangdFileStatus = true },
})

vim.lsp.config("pyright", {
  settings = {
    pyright = { disableOrganizeImports = true },
    python = { analysis = { ignore = { "*" } } },
  },
})

vim.lsp.enable("clangd")
vim.lsp.enable("pyright")
vim.lsp.enable("ruff")
