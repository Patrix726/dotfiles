require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", ",", ";", { desc = "Repeat last f or t command"})
map("n", ":", ",", { desc = "Execute the inverse of the last f or t command"})
map({"n","v"}, "H", "^", { desc = "Go to the beginning of the line"})
map({"n","v"}, "L", "$", { desc = "Go to the end of the line"})
map("n", "dH", "d^", { desc = "Delete upto beginning of line"})
map("n", "dL", "d$", { desc = "Delete upto end of line"})
map("n", "cH", "c^", { desc = "Cut upto beginning of line"})
map("n", "cL", "c$", { desc = "Cut upto end of line"})
map("n", "<A-j>", ":m .+1<cr>==", { desc = "Move current line to below"})
map("n", "<A-k>", ":m .-2<cr>==", { desc = "Move current line to above"})
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
map('n', '<leader>gi', ':Neogit<CR>', {noremap = true, desc = "Open Neogit dashboard"})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
