-- return {
-- 	"nyoom-engineering/oxocarbon.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		vim.opt.background = "dark"
-- 		vim.cmd("colorscheme oxocarbon")
-- 	end,
-- }

return {
	"Shatur/neovim-ayu",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("ayu").setup({
			overrides = {
				Normal = { bg = "None" },
				NormalFloat = { bg = "none" },
				ColorColumn = { bg = "None" },
				SignColumn = { bg = "None" },
				Folded = { bg = "None" },
				FoldColumn = { bg = "None" },
				CursorLine = { bg = "None" },
				CursorColumn = { bg = "None" },
				VertSplit = { bg = "None" },
			},
		})
		vim.opt.background = "dark", vim.cmd("colorscheme ayu")
	end,
}
