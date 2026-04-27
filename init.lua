-- 🐰 Thank you for using my config!🐰 
-- ／(=⌒ x ⌒=)＼
vim.g.mapleader = ' '
vim.o.background = "light" -- Sorry not sorry light-theme haters ૮₍ ´ ꒳ `₎ა 
vim.o.termguicolors = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.wrap = false
vim.o.number = true
vim.o.relativenumber = true
vim.diagnostic.config({ virtual_text = true }) -- Enable inline diagnostics
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Clear search highlights with Esc.
-- Exit Terminal mode with <Esc><Esc> as the default one is hard to access to non-us layouts (<C-\><C-n>)
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "trigger autocompletion" }) -- Easier than omni
-- Transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- Built-in autocompletion
vim.opt.completeopt = { "menuone", "noselect", "popup" }
-- Let's use the built-in package manager for Neovim!
 vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig"}, -- Check the lsp folder to fix the "Undefined global 'vim' " issue
	{ src = "https://github.com/mason-org/mason.nvim"},
    { src = "https://github.com/romus204/tree-sitter-manager.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim"},
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim"},
	{ src = "https://github.com/nvim-mini/mini.nvim", version = "stable"},
    { src = "https://github.com/nvim-lua/plenary.nvim"}, -- Dependency for Harpoon, soon to be archived :(
    {
        src = "https://github.com/ThePrimeagen/harpoon",
        version = 'harpoon2',
    },
 })
 -- Mason setup
require("mason").setup()

-- LSP and tool config
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {"lua_ls", "pyright", "gopls", "eslint_d"} -- Make sure to install the correct dependencies for your LSP! (Pyright will not install without node, gopls without go and so on)
} )

vim.lsp.config('*', {
    on_attach = function(client, bufnr)
      vim.lsp.completion.enable(true, client.id, bufnr, {
		autotrigger = true,
		convert = function(item)
          return { abbr = item.label:gsub("%b()", "") }
		end,
      })
    end
})

-- Tree Sitter Manager config
-- You need tree-sitter-cli and a c compiler in yout PATH for this to work
require("tree-sitter-manager").setup({
  ensure_installed = {"go"}, -- list of parsers to install at the start of a neovim session
  auto_install = false, -- if enabled, install missing parsers when editing a new file
  highlight = true, -- treesitter highlighting is enabled by default
})


-- Mini.nvim plugins setup
-- For more info, go look up mini.nvim in Github
require('mini.ai').setup()
require('mini.animate').setup()
require('mini.icons').setup()
require('mini.statusline').setup({
    use_icons = true
})

-- Harpoon setup
local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-l>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<C-5>", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<C-S-J>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-K>", function() harpoon:list():next() end)
