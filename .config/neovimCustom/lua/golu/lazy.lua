local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	--	{ import = "golu.plugins" },
	{ import = "golu.plugins.lsp" },
	{ import = "golu.plugins.tools" },
	{ import = "golu.plugins.debugging-tools" },
	{ import = "golu.plugins.ui-tools" },
	{ import = "golu.plugins.language-tools" },
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
