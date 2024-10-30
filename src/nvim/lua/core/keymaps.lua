-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts, { desc = "Save file" })

-- save file without auto-formatting
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts, { desc = "Save file no-autoformatting" })

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts, { desc = "Quit" })

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Fast escape
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("i", "kj", "<ESC>", opts)

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts, { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts, { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", opts, { desc = "Close buffer" }) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts, { desc = "New buffer" }) -- new buffer

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts, { desc = "Split vertical" }) -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts, { desc = "Split horizontal" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts, { desc = "Reset split width & height" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts, { desc = "Close current split windows" }) -- close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts, { desc = "Move up window" })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts, { desc = "Move down window" })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts, { desc = "Move left window" })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts, { desc = "Move right window" })

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts, { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts, { desc = "Close new tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts, { desc = "Move next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts, { desc = "Move prev tab" }) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts, { desc = "Wrap a long text line" }) -- Wrap a long line

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Unset highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
