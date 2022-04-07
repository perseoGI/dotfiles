local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("error")
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

local ismacos = function()
	return true
end

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Theme
	-- Colorscheme
	use("gruvbox-community/gruvbox")
	use("sainnhe/gruvbox-material")

	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("perseoGI.bufferline").setup({})
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("perseoGI.lualine").setup({})
		end,
	})

	-- Undo tree
	use("mbbill/undotree")

	-- Fzf
	use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})
	use("junegunn/fzf.vim")
	use("kshenoy/vim-signature") -- Show marks

	-- ToDo list
	use("vuciv/vim-bujo") -- Minimalist TODO list management

	-- use("jiangmiao/auto-pairs")	-- Auto open close pairs, best plug of Augost-2020
	-- After having tested coc-html, coc-emmet, coc-snippets, this is the best option for auto-closing html tags on jsx
	use("alvan/vim-closetag")

	-- Cool maximizer/minimizer pluggin
	use("szw/vim-maximizer")

	-- Go-To-Finder / Go-To-Terminal (current buffer)
	use("justinmk/vim-gtfo")

	-- use("honza/vim-snippets")
	-- use("SirVer/ultisnips")
	-- use("quangnguyen30192/cmp-nvim-ultisnips")

	use("tpope/vim-fugitive") -- Git blames, logs...
	use("tpope/vim-surround")
	use("tpope/vim-commentary")
	use("tpope/vim-repeat")
	-- Vim text objects
	use("kana/vim-textobj-user") -- Base for following plugins
	use("kana/vim-textobj-entire") -- ae, ie
	use("kana/vim-textobj-indent") -- ai, aI, ii, iI
	use("kana/vim-textobj-line") -- al, il
	use("kana/vim-textobj-function") -- af, if
	use("Matt-A-Bennett/vim-surround-funk")

	-- Debugger
	use({ "puremourning/vimspector", run = "python3 install_gadget.py --enable-vscode-cpptools" })

	-- Markdown
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = { "markdown" },
		config = function()
			require("perseoGI.markdown-preview").setup({})
		end,
	})

	-- Apple support to V-Block copy-paste
	use({
		"bfredl/nvim-miniyank",
		-- cond = function() return vim.fn.has('macunix') == 1 or vim.fn.has('mac') == 1  end
		cond = { ismacos },
	})

	-- Discord vimscene
	use({
		"andweeb/presence.nvim",
		config = function()
			require("perseoGI.presence").setup({})
		end,
	})

	-- Get better at vim from the best streamer ever
	use({
		"ThePrimeagen/vim-be-good",
		run = "./install.sh",
		config = function()
			require("perseoGI.presence").setup({})
		end,
	})

        -- Nvim-tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("perseoGI.nvim-tree").setup({})
		end,
	})

        -- Formater
	use("sbdchd/neoformat")

	-- Telescope
	use("nvim-lua/popup.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("perseoGI.telescope").setup({})
		end,
	})
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use("nvim-telescope/telescope-symbols.nvim")

        -- Harpoon
	use("ThePrimeagen/harpoon")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		opt = true,
		event = "BufRead",
		run = ":TSUpdate",
		config = function()
			require("perseoGI.treesitter").setup()
		end,
		requires = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
	})

	-- LSP config
	use("neovim/nvim-lspconfig")
	-- Show lsp errors on Telescope
	use("folke/trouble.nvim")
	-- Improves LSP completion
	-- use("nvim-lua/completion-nvim")

	-- use("hrsh7th/cmp-nvim-lsp")
	-- use("hrsh7th/cmp-buffer")
	-- use("hrsh7th/nvim-cmp")

	use({
		"ms-jpq/coq_nvim",
		branch = "coq",
		-- event = "InsertEnter",
		-- opt = true,
		run = ":COQdeps",
		config = function()
			require("perseoGI.coq").setup()
		end,
		requires = {
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },
			{ "ms-jpq/coq.thirdparty", branch = "3p", module = "coq_3p" },
		},
		-- disable = false,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
