require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", ",", ";", { desc = "Repeat last f or t command"})
map("n", ":", ",", { desc = "Execute the inverse of the last f or t command"})
map("n", "U", "<C-r>", { desc = "Redo key"})
map("i", "jk", "<ESC>")
map('n', '<leader>rr', ':RunCode<CR>', { noremap = true, silent = false })
map('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
map('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
map('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
map('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
map('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
map('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
map('n', 'q', 'b', {desc = "One word back"})
map('n', 'b', '%', {desc = "Complimenting bracket"})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
