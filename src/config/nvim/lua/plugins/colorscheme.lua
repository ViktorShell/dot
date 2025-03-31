return {
	"nyoom-engineering/oxocarbon.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		vim.opt.background = "dark"
		vim.cmd("colorscheme oxocarbon")
	end,
}

-- return {
-- 	"Shatur/neovim-ayu",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		vim.opt.background = "light", vim.cmd("colorscheme ayu")
-- 	end,
-- }

-- return {
-- 	"morhetz/gruvbox",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		vim.opt.background = "light"
-- 		vim.cmd("colorscheme gruvbox")
-- 	end,
-- }
