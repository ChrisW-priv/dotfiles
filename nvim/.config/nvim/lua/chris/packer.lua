local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Nice colorschemes for nvim
    use({
        'rose-pine/neovim', as = 'rose-pine',
        -- config = function() vim.cmd('colorscheme rose-pine') end
    })

    use({
        'morhetz/gruvbox', as = 'gruvbox',
        config = function() vim.cmd('colorscheme gruvbox') end
    })

    -- DAP
    use 'mfussenegger/nvim-dap'

    use {
        'rcarriga/nvim-dap-ui',
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end
    }

    use 'nvim-neotest/nvim-nio'
    use 'nvim-telescope/telescope-dap.nvim'

    use {
        'mfussenegger/nvim-dap-python',
        dependencies = {
            'mfussenegger/nvim-dap',
            'rcarriga/nvim-dap-ui',
        },
        config = function()
            require('dap-python').setup('python')
        end
    }

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },  -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },  -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    use('tpope/vim-surround')
    use("mattn/emmet-vim")
    use("terrortylor/nvim-comment")

    if packer_bootstrap then
        require('packer').sync()
    end
end)

