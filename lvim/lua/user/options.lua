vim.opt.guicursor = ""
vim.opt.scrolloff = 8

vim.log.level = "warn"

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
lvim.builtin.terminal.direction = "float"
lvim.builtin.terminal.open_mapping = "<C-t>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
lvim.colorscheme = "tokyonight-night"

-- customizationsi nvim tree
lvim.builtin.nvimtree.setup.git.ignore = true
lvim.builtin.nvimtree.setup.actions.change_dir.restrict_above_cwd = true
lvim.builtin.nvimtree.setup.update_cwd = false

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.filters.custom = {}

-- treesitter
lvim.builtin.treesitter.ignore_install = {}
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

-- project
-- lvim.builtin.project.detection_methods = { "lsp", "pattern" }
lvim.builtin.project.patterns = {
  ".git",
}

-- telescope
lvim.builtin.telescope.defaults.path_display = {
  shorten = 4,
}

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
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
    },
    ft = { "fugitive" },
  },
  {
    "tpope/vim-surround",

    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
  },
  { "tpope/vim-repeat" },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "kkharji/sqlite.lua" },
  },
  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
    end,
  },
  {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("hop").setup()
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup {}
      end, 100)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "frecency")
  pcall(telescope.load_extension, "neoclip")
end

-- keymaps
lvim.keys.normal_mode["<leader>tt"] = ":TroubleToggle<CR>"
lvim.keys.normal_mode["<leader>tw"] = ":TroubleToggle workspace_diagnostics<CR>"
lvim.keys.normal_mode["<leader>td"] = ":TroubleToggle document_diagnostics<CR>"
lvim.keys.normal_mode["<leader>tl"] = ":TroubleToggle loclist<CR>"
lvim.keys.normal_mode["<leader>tq"] = ":TroubleToggle quickfix<CR>"

lvim.keys.normal_mode["<leader>y"] = ":Telescope neoclip default<CR>"

lvim.keys.insert_mode["jk"] = "<ESC>"
