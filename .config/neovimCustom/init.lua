require("golu.core")
require("golu.lazy")
local g = vim.g
g.neovide_transparency = 0.83

vim.g.neovide_padding_top = 14
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0

-- vim.cmd("hi Normal guibg=NONE")
-- vim.cmd("hi NonText guibg=NONE")
-- vim.cmd("hi SignColumn guibg=NONE")
--
--StatusLine Modification
--Define colors
-- local colors = {
-- 	bg = "#11111b",
-- 	fg = "#9399b2",
--
-- 	yellow = "#f9e2af",
-- 	cyan = "#f5c2e7",
-- 	green = "#a6e3a1",
-- 	orange = "#fab387",
-- 	magenta = "#b4befe",
-- 	blue = "#89b4fa",
-- }
--
-- -- Git Branch Function
-- function GitBranch()
-- 	local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null")
-- 	if vim.v.shell_error ~= 0 then
-- 		return ""
-- 	end
-- 	return " " .. vim.fn.trim(branch)
-- end
--
-- -- Statusline Configuration
-- vim.o.statusline = table.concat({
-- 	"%#StatusLine#",
-- 	'%{expand("%:p")}', -- Full file path
-- 	"%=",
-- 	"(%#GitBranch#%{v:lua.GitBranch()}%#StatusLine#)", -- Git branch
-- 	"%#FileType#[%{&filetype}]%#StatusLine#", -- File type with green color
-- 	"%#RowCol#[%l,%c]%#StatusLine#", -- Row and column with blue color
-- })
--
-- -- Define statusline highlight groups
-- vim.cmd(string.format("highlight StatusLine guibg=%s guifg=%s", colors.bg, colors.fg))
-- vim.cmd(string.format("highlight StatusLineNC guibg=%s guifg=%s", colors.bg, colors.fg))
-- vim.cmd(string.format("highlight GitBranch guibg=%s guifg=%s", colors.bg, colors.yellow))
-- vim.cmd(string.format("highlight FileType guibg=%s guifg=%s", colors.bg, colors.fg))
-- vim.cmd(string.format("highlight RowCol guibg=%s guifg=%s", colors.bg, colors.blue))
