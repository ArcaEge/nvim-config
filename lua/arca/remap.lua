vim.g.mapleader = " "

vim.keymap.set("n", "<leader><leader>", vim.cmd.WhichKey)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

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
