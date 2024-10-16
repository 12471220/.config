local opt=vim.opt

-- appearance
opt.relativenumber=true
opt.number=true
opt.tabstop=4
opt.shiftwidth=4
opt.expandtab=true
opt.autoindent=true
--theme
--vim.cmd("colorscheme snazzy")
vim.cmd("colorscheme gruvbox")
vim.g.gruvbox_contrast_dark='hard'
vim.g.grub_blod=1
--vim.cmd[[let g:gruvbox_contrast_dark='light']]
--vim.cmd[[let g:gruvbox_italic=1]]


--opt.wrap=false
--color
opt.termguicolors=true
opt.signcolumn="yes"
--cursor
opt.cursorline=true
opt.mouse:append("a")

--clipboard for x window ,must install xclip to use
opt.clipboard:append("unnamedplus")

--new window pos
opt.splitright=true
opt.splitbelow=true

--search
opt.ignorecase=true
opt.smartcase=true

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
