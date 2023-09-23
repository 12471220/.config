vim.g.mapleader=" "

local keymap=vim.keymap

-- ===insert===
keymap.set("i","jk","<ESC>")

-- ===visual===

-- ===normal===
  --cancel hl--
keymap.set("n","<leader>nh",":nohl<CR>")
keymap.set("n","J","5j")
keymap.set("n","K","5k")
