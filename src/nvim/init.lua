require("core.options") -- Load options
require("core.keymaps") -- Load keymaps
require("core.snippets") -- Custome code snippets

-- Lazy Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup({
	(function()
		local ptab, dir = {}, io.popen("ls $HOME/.config/nvim/lua/plugins")
		for pname in dir:lines() do
			ptab[#ptab + 1] = require("plugins." .. string.sub(pname, 0, -5))
		end
		dir:close()
		return ptab
	end)(),
})
