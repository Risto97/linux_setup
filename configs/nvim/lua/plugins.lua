local execute = vim.api.nvim_command
local fn = vim.fn

local packer_install_dir = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

local plug_url_format = 'https://github.com/%s'

local packer_repo = string.format(plug_url_format, 'wbthomason/packer.nvim')
local install_cmd = string.format('10split |term git clone --depth=1 %s %s', packer_repo, packer_install_dir)

if fn.empty(fn.glob(packer_install_dir)) > 0 then
    print("installing")
  vim.api.nvim_echo({{'Installing packer.nvim', 'Type'}}, true, {})
  vim.api.nvim_exec(install_cmd, true)
end





vim.cmd("packadd packer.nvim")


return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- use 'rstacruz/vim-closer'
    use 'Yggdroot/LeaderF'
    use 'tamago324/LeaderF-filer'
    use 'liuchengxu/vim-which-key'
    use 'tomtom/tcomment_vim'
    use 'tpope/vim-surround'
    use 'terryma/vim-multiple-cursors'
    use 'thinca/vim-quickrun'
    use 'moll/vim-bbye'
    use 'airblade/vim-rooter'
    use 'xolox/vim-session'
    use 'xolox/vim-misc'
    use 'pelodelfuego/vim-swoop'
    use 'kdheepak/lazygit.nvim'
    use 'dominikduda/vim_current_word'
    use 'ton/vim-bufsurf'

    use {
      "startup-nvim/startup.nvim",
      requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
      config = function()
        require"startup".setup()
      end
    }

    -- status line
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- LSP install
    use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use { 'saadparwaiz1/cmp_luasnip' }
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
    use {
      "ray-x/lsp_signature.nvim",
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        "RRethy/nvim-treesitter-endwise",
        wants = "nvim-treesitter",
        event = "InsertEnter",
    }

    -- FZF
    use  { 'junegunn/fzf', run = './install --bin', }
    use { 'ibhagwan/fzf-lua',
      -- optional for icon support
      requires = { 'kyazdani42/nvim-web-devicons' }
    }

    -- Themes and colors
    use { 'marko-cerovac/material.nvim' }
end)

