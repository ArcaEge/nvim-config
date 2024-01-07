vim.g.mapleader = " "

vim.keymap.set("n", "<leader><leader>", vim.cmd.WhichKey)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Barbar
vim.keymap.set({"n", "t"}, "<A-h>", vim.cmd.BufferPrevious)
vim.keymap.set({"n", "t"}, "<A-l>", vim.cmd.BufferNext)
vim.keymap.set({"n", "t"}, "<A-H>", vim.cmd.BufferMovePrevious)
vim.keymap.set({"n", "t"}, "<A-L>", vim.cmd.BufferMoveNext)

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map({"n", "t"}, '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map({"n", "t"}, '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map({"n", "t"}, '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map({"n", "t"}, '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map({"n", "t"}, '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map({"n", "t"}, '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map({"n", "t"}, '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map({"n", "t"}, '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map({"n", "t"}, '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map({"n", "t"}, '<A-0>', '<Cmd>BufferLast<CR>', opts)

map({"n", "t"}, '<A-p>', '<Cmd>BufferPin<CR>', opts)
map({"n", "t"}, '<A-c>', '<Cmd>BufferClose<CR>', opts)
map({"n", "t"}, '<C-p>', '<Cmd>BufferPick<CR>', opts)


-- Move lines around when highlighted
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")   -- allows cursor to remain in same place when deleting \n

-- Forces cursor to remain in middle when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Forces search terms to stay in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Allows paste without losing current paste buffer
vim.keymap.set("x", "<leader>pp", [["_dP]])

-- Copy to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to void register (delete, don't cut)
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Allow exiting vertical edit mode with <C-c>
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")   -- Disable Q (not q)
vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Clear Search
vim.keymap.set("n", "<leader>cs", vim.cmd.nohl)

-- Replace current word
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- UndoTree toggle
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- NeoTree toggle
vim.keymap.set("n", "\\", function() vim.cmd.Neotree('toggle') end)


vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>fo', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
