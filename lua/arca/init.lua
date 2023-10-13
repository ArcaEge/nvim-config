require("arca.remap")
require("arca.telescope")
require("arca.treesitter")
require("arca.lsp")

--vim.opt.guicursor = "" -- Makes insert mode cursor block shape

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 4  -- Tab size
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false    -- Disable line wrap

--vim.opt.swapfile = false    -- Disable recover file
--vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--vim.opt.hlsearch = false    -- Disable search highlighting
vim.opt.incsearch = true

vim.opt.termguicolors = true    -- Better colours

vim.opt.scrolloff = 8   -- Scroll offset
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

--vim.opt.colorcolumn = "80"
--vim.o.scrolloff = 3

vim.cmd("colorscheme kanagawa")
--vim.cmd("set clipboard=unnamedplus")  -- Share Clipboard with system
--vim.cmd("set cursorline")
-- vim.cmd("set completeopt=noinsert,menuone,noselect")
vim.cmd("set title")
--vim.cmd("set wildmenu")
vim.cmd("set t_Co=256")
