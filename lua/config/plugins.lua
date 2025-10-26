vim.pack.add({
  { src = 'https://github.com/Mofiqul/vscode.nvim' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/williamboman/mason.nvim' },
  { src = 'https://github.com/williamboman/mason-lspconfig.nvim' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/hrsh7th/nvim-cmp' },
  { src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
  { src = 'https://github.com/hrsh7th/cmp-buffer' },
  { src = 'https://github.com/hrsh7th/cmp-path' },
  { src = 'https://github.com/p00f/clangd_extensions.nvim' },
})

vim.cmd('packadd plenary.nvim')
vim.cmd('packadd nvim-lspconfig')
vim.cmd('packadd cmp-nvim-lsp')
vim.cmd('packadd nvim-cmp')
vim.cmd('packadd mason.nvim')
vim.cmd('packadd mason-lspconfig.nvim')
vim.cmd('packadd nvim-treesitter')
vim.cmd('packadd vscode.nvim')
vim.cmd('packadd clangd_extensions.nvim')

local mason_ok, mason = pcall(require, "mason")
local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")

if mason_ok then
  mason.setup()
end
if mason_lspconfig_ok then
  mason_lspconfig.setup({
    ensure_installed = { "clangd", "pyright", "ruff" },
  })
end

local ts_ok, ts = pcall(require, "nvim-treesitter.configs")
if ts_ok then
  ts.setup({
    ensure_installed = { "c", "cpp", "lua", "python" },
    highlight = { enable = true },
  })
else
  vim.notify("nvim-treesitter error", vim.log.levels.WARN)
end

local cmp_ok, cmp = pcall(require, "cmp")
local cmp_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
  vim.o.pumheight = 2
  cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<C-Space>"] = cmp.mapping.complete(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping.abort(),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "path" },
    }),
  })
else
  vim.notify("nvim-cmp error", vim.log.levels.WARN)
end

local capabilities = {}
if cmp_lsp_ok then
  capabilities = cmp_nvim_lsp.default_capabilities()
end


local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)

  if client.name == "ruff" then
    client.server_capabilities.hoverProvider = false
    vim.keymap.set("n", "<leader>co", function()
      vim.lsp.buf.code_action({
        context = { only = { "source.organizeImports" } },
        apply = true,
      })
    end, bufopts)
  end
end

--root_dir from mason-lspconfig
vim.lsp.config("clangd", {
  capabilities = capabilities,
  on_attach = on_attach,
  keys = { { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch C/C++" } },
  cmd = {
    "clangd", "--background-index", "--clang-tidy",
    "--header-insertion=iwyu", "--completion-style=detailed",
    "--function-arg-placeholders", "--fallback-style=llvm",
  },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true
  },
})
vim.lsp.enable('clangd')

--vim.lsp.config("pyright", {
--  capabilities = capabilities,on_attach = on_attach,
--  settings = {pyright = { disableOrganizeImports = true },},
--})
--vim.lsp.config("ruff", {-capabilities = capabilities,-on_attach = on_attach,})

--vim.lsp.enable('pyright')
--vim.lsp.enable('ruff')
