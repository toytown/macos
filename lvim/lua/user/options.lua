vim.opt.guicursor = ""
vim.opt.scrolloff = 8
vim.g.tokyonight_dark_sidebar = true

lvim.log.level = "warn"

-- disable up/down arrow keys (customizations)
vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("n", "<Right>", "<nop>")
vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")

-- store yanked info in register
vim.keymap.set("v", "p", '"_dP"')

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')

-- split windows (customization)
lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["-"] = ":split<CR>"

-- bufferline shortcuts (customization)
lvim.keys.normal_mode["<Tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-x>"] = ":BufferKill<CR>"

-- toggleterm (customization)
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.open_mapping = "<C-t>"
lvim.builtin.terminal.shade_terminals = false
lvim.builtin.terminal.shading_factor = 1

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
lvim.colorscheme = "tokyonight-night"

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"

-- customizations
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.actions.change_dir.restrict_above_cwd = true
lvim.builtin.nvimtree.setup.git.ignore = true

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "stylua" },
	{
		command = "prettier",
		extra_args = { "--print-width", "120" },
		filetypes = { "typescript", "typescriptreact" },
	},
})
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "flake8", filetypes = { "python" } },
	{ command = "eslint", filetypes = { "typescript", "typescriptreact" } },
	{
		command = "shellcheck",
		args = { "--severity", "warning" },
	},
})

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{
		"folke/tokyonight.nvim",
	},
}
lvim.keys.normal_mode["<leader>tt"] = ":TroubleToggle<CR>"
lvim.keys.normal_mode["<leader>tw"] = ":TroubleToggle workspace_diagnostics<CR>"
lvim.keys.normal_mode["<leader>td"] = ":TroubleToggle document_diagnostics<CR>"
lvim.keys.normal_mode["<leader>tl"] = ":TroubleToggle loclist<CR>"
lvim.keys.normal_mode["<leader>tq"] = ":TroubleToggle quickfix<CR>"
