vim.g.mapleader=" "

local keymap=vim.keymap

-- ===insert===
keymap.set("i","jk","<ESC>")

-- ===visual===
keymap.set("v","J","5j")
keymap.set("v","K","5k")

-- ===normal===
keymap.set("n", "J", "5j")
keymap.set("n", "K", "5k")
-- save the file
keymap.set("n", "<leader>s", "<Cmd>w<CR>")
-- cancel hl--
--keymap.set("n", "<leader>nh", "<Cmd>nohl<CR>") 
-- rename the file
keymap.set("n", "<leader>r", ":saveas ")

-- bufferline
keymap.set('n', '<leader>n', ':BufferLineCycleNext<CR>', { desc = "next buffer" })
keymap.set('n', '<leader>p', ':BufferLineCyclePrev<CR>', { desc = "previous buffer" })

-- 移动 buffer 位置
--vim.keymap.set('n', '<leader>b>', ':BufferLineMoveNext<CR>', { desc = "向右移动 buffer" })
--vim.keymap.set('n', '<leader>b<', ':BufferLineMovePrev<CR>', { desc = "向左移动 buffer" })

-- 关闭 buffer
vim.keymap.set('n', '<leader>x', ':bdelete<CR>', { desc = "close current buffer" })
vim.keymap.set('n', '<leader>X', ':bdelete!<CR>', { desc = "force close current buffer" })

