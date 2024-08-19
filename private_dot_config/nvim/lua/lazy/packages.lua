local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "AstroNvim/astrotheme" },
	{ "lewis6991/gitsigns.nvim" },
	{ 'folke/tokyonight.nvim' },
	{ 'rebelot/kanagawa.nvim' },
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
	-- { "catppuccin/nvim",            name = "catppuccin", priority = 1000 },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			term_colors = true,
			transparent_background = false,
			styles = {
				comments = {},
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
			},
			-- color_overrides = {
			-- 	mocha = {
			-- 		base = "#000000",
			-- 		mantle = "#000000",
			-- 		crust = "#000000",
			-- 	},
			-- },
			integrations = {
				telescope = {
					enabled = true,
					style = "nvchad",
				},
				dropbar = {
					enabled = true,
					color_mode = true,
				},
			},
		},
	},
	{ 'nvim-lualine/lualine.nvim' },
	{ 'nvim-tree/nvim-web-devicons' },
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies =
		'nvim-tree/nvim-web-devicons'
	},
	{ "lukas-reineke/indent-blankline.nvim",         main = "ibl",                                    opts = {} },
	{ 'nvim-treesitter/nvim-treesitter',             build = ":TSUpdate" },
	{ "nvim-treesitter/nvim-treesitter-textobjects", dependencies = "nvim-treesitter/nvim-treesitter" },
	{ "numToStr/Comment.nvim" },
	{ "nvim-tree/nvim-tree.lua" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep",
			"sharkdp/fd" }
	},
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	{ "akinsho/toggleterm.nvim" },
	{ "lewis6991/gitsigns.nvim" },
	-- LSP packages: https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
	{ 'VonHeikemen/lsp-zero.nvim',                branch = 'v3.x' },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-nvim-lsp" },
	-- {"L3MON4D3/LuaSnip", dependencies = {"rafamadriz/friendly-snippets"}},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		dependencies = "rafamadriz/friendly-snippets",
	},
	{ "rafamadriz/friendly-snippets" }, -- TODO: use load vscode whatever
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim", dependencies = "williamboman/mason.nvim" },
	{
		"lervag/vimtex",
		event = "BufRead",
		lazy = false,
		config = function()
			-- A lot of important info is here https://dr563105.github.io/blog/skim-vimtex-setup/
			-- and here https://znculee.github.io/blogs/tools/vim#vimtex
			vim.g.tex_flavor = "latex"
			vim.g.vimtex_view_method = "zathura_simple"
			vim.g.vimtex_view_use_temp_fules = 1
			-- vim.g.vimtex_view_general_viewer = "okular"
			-- vim.g.vimtex_quickfix_open_on_warning = 0
			-- Value 1 allows forward search after every successful compilation
			-- vim.g.vimtex_view_skim_sync = 1
			-- Value 1 allows change focus to skim after command `:VimtexView` is given
			-- vim.g.vimtex_view_skim_activate = 1
		end,
	},
	{
		'goolord/alpha-nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
		end
	},
	{
		'akinsho/flutter-tools.nvim',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'stevearc/dressing.nvim', -- optional for vim.ui.select
		},
		config = true,
	}
})
