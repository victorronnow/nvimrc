vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.o.scrolloff = 12
vim.g.netrw_banner = 0
vim.opt.breakindent = true
vim.g.have_nerd_font = true
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
