local opt=vim.opt

-- appearance
opt.relativenumber=true
opt.number=true
opt.tabstop=2
opt.shiftwidth=2
opt.expandtab=true
opt.autoindent=true
--theme
vim.cmd[[colorscheme snazzy]]

--opt.wrap=false
--color
opt.termguicolors=true
opt.signcolumn="yes"
--cursor
opt.cursorline=true
opt.mouse:append("a")

--clipboard!!
opt.clipboard:append("unnamedplus")

--new window pos
opt.splitright=true
opt.splitbelow=true

--search
opt.ignorecase=true
opt.smartcase=true

