-- appearance
vim.opt.relativenumber=true
vim.opt.number=true
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.autoindent=true
--themes
vim.cmd("colorscheme snazzy")
--vim.cmd("colorscheme gruvbox")
--vim.g.gruvbox_contrast_dark='hard'
--vim.g.grub_blod=1
--vim.cmd[[let g:gruvbox_contrast_dark='light']]
--vim.cmd[[let g:gruvbox_italic=1]]


--opt.wrap=false
--color
vim.opt.termguicolors=true
vim.opt.signcolumn="yes"
--cursor
vim.opt.cursorline=true
vim.opt.mouse:append("a")

--clipboard for x window ,must install xclip to use
vim.opt.clipboard:append("unnamedplus")

--new window pos
vim.opt.splitright=true
vim.opt.splitbelow=true

--search
vim.opt.ignorecase=true
vim.opt.smartcase=true

-- disable netrw(file-tree plugin) at the very start of your init.lua
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

-- highlight column
vim.opt.cursorcolumn=true
vim.opt.termguicolors = true

vim.opt.mousemoveevent=true
