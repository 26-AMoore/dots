local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('plugins.config.telescope')
		end,
	},
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('plugins.config.nvim-tree')
		end,
	},
	{
		'catppuccin/vim',
		config = function() 
			vim.cmd.colorscheme("catppuccin_mocha")
		end
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			require('plugins.config.indent-blankline')
		end,
		version = "2.0.0"
	},
	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('plugins.config.treesitter')
		end
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-nvim-lsp',
			'saadparwaiz1/cmp_luasnip',
			'L3MON4D3/LuaSnip',
			'Saecki/crates.nvim',
			'rafamadriz/friendly-snippets',
		},
		config = function()
			require('plugins.config.cmp')
		end,
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
		},
		config = function()
			require('plugins.config.lsp')
		end
	},
	{
		'rust-lang/rust.vim',
		config = function()
			vim.g.rustfmt_autosave = true
		end
	},
	{
		'andweeb/presence.nvim',
		config = function()
			require('plugins.config.discord')
		end
	},
--	{
--    	"aPeoplesCalendar/apc.nvim",
--    	dependencies = {
--     	   "rcarriga/nvim-notify",
--    	},
--    	event = "VeryLazy",
--    	config = function ()
--        	require("apeoplescalendar").setup() -- configuration options are described below
--    	end,
--	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
	}
	},
--	{
--		'glepnir/galaxyline.nvim',
--		branch = 'main',
		-- your statusline
--		config = function()
--	    	require('my_statusline')
--		end,
		-- some optional icons
--		require = { 'nvim-tree/nvim-web-devicons', opt = true },
--	},
	--{
--	'nvimdev/dashboard-nvim',
--	event = 'VimEnter',
--	config = function()
--    	require('dashboard').setup {
--   	-- config
--			theme = 'hyper',
--			shortcut_type = 'number'
  --  }
--	--end,
--	dependencies = { 'nvim-tree/nvim-web-devicons'}
--	},
	{
    'gsuuon/note.nvim',
    opts = {
      -- Spaces are note roots. These directories should contain a `./notes` directory (will be made if not).
      -- Defaults to { '~' }.
      spaces = {
        '~',
        -- '~/projects/foo'
    	},

      -- Set keymap = false to disable keymapping
      -- keymap = { 
      --   prefix = '<leader>n'
      -- }
    	},
    	cmd = 'Note',
    	ft = 'note'
	},
	{
	'rcarriga/nvim-notify'
	},
--	{
--	'vim-airline/vim-airline'
--	},
--	{
--	'vim-airline/vim-airline-themes'
--	},
	{
	'nvim-lualine/lualine.nvim',
	},
	{
	'nvim-tree/nvim-web-devicons'
	},
	{
	'iagoleal/doctor.nvim'
	},
	{
	'mhartington/formatter.nvim'
	},
})
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'moonfly', --  powerline_dark
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diagnostics'},
    lualine_c = {'filename', 'filesize'},
    lualine_x = {'encoding', 'fileformat'},
    lualine_y = {'filetype',},
    lualine_z = {'progress'}
  },
  inactive_sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diagnostics'},
    lualine_c = {'filename', 'filesize'},
    lualine_x = {'encoding', 'fileformat'},
    lualine_y = {'filetype',},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

