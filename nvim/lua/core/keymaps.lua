vim.g.mapleader=" "

local keymap=vim.keymap

-- ===insert===
keymap.set("i","jk","<ESC>")

-- ===visual===
keymap.set("v","J","5j")
keymap.set("v","K","5k")

-- ===normal===
keymap.set("n","<leader>nh",":nohl<CR>") --cancel hl--
keymap.set("n","J","5j")
keymap.set("n","K","5k")
