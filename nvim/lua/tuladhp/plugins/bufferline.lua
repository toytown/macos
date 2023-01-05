require("bufferline").setup({})

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
vim.keymap.set("n", "<leader>xR", "<Cmd>BufferLineCloseRight<CR>", {})
vim.keymap.set("n", "<leader>xL", "<Cmd>BufferLineCloseLeft<CR>", {})
