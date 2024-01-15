local M = {}

M.mybindings = 
{
  i = {
    ["jk"] = {"<ESC>", "escape insert mode", opts = { nowait = true }},
    ["kj"] = {"<ESC>", "escape insert mode", opts = { nowait = true }},
  },
  n = {
    ["<leader>tt"] = {"<cmd>lua require(\"base46\").toggle_transparency()<CR>", "toggle transparency", opts = { nowait = true}},
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
  }
}

return M

