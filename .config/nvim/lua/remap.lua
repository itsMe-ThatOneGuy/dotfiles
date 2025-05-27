-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.skip_ts_context_commentstring_module = true
keymap("i", "jj", "<Esc>")

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

--Toggle spellcheck
local function toggle_spell_check()
	vim.opt.spell = not (vim.opt.spell:get())
end
keymap("n", "<F12>", toggle_spell_check, opts)
-- Clear highlights
keymap("n", "<Esc>h", "<cmd>nohlsearch<CR>", opts)

-- Source
keymap("n", "xx", "<cmd>source %<CR>")
keymap("n", "xc", ":.lua<CR>")
keymap("v", "xc", ":.lua<CR>")

-- Diagnostic
keymap("n", "gl", vim.diagnostic.open_float, { desc = "Show Diagnostic message float" })
keymap("n", "<leader>lj", vim.diagnostic.goto_next, { desc = "Next Diagnostic message" })
keymap("n", "<leader>lk", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic message" })
keymap("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "Diagnostic Quickfix list" })

-- Make file exec
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Buffer
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- Close buffers
keymap("n", "<S-q>", "<cmd>bdelete!<CR>", opts)

-- Window
-- Better window navigation
keymap("n", "<C-h>", "<C-w><C-h>", opts)
keymap("n", "<C-j>", "<C-w><C-j>", opts)
keymap("n", "<C-k>", "<C-w><C-k>", opts)
keymap("n", "<C-l>", "<C-w><C-l>", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
keymap("n", "<leader>li", "<cmd>LspInfo<cr>")
keymap("n", "<leader>mi", "<cmd>Mason<cr>")

-- Term
keymap("n", "<leader>st", function()
	vim.cmd("cd %:p:h")
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd("startinsert")
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 5)
end)
