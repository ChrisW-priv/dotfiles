vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd> !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- rename for entire file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("i", "{<CR>", "{<CR>}<CR><Esc>kO")
vim.keymap.set("i", "{{", "{{  }}<Left><Left><Left>")
vim.keymap.set("i", "{%", "{%  %}<Left><Left><Left>")

vim.keymap.set("i", "<A-j>", "<Down>")
vim.keymap.set("i", "<A-h>", "<Left>")
vim.keymap.set("i", "<A-k>", "<Up>")
vim.keymap.set("i", "<A-l>", "<Right>")

vim.keymap.set({"n", "v"}, "<C-_>", ":CommentToggle<CR>")

vim.keymap.set({"n", "v", "i"}, "<C-s>", "<Esc>:w<CR>")

-- paste image from clip
vim.keymap.set("n", "<leader>v", "<cmd>PasteImage<cr>")

