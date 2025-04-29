-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    ----- Color schemes -----
    --rose-pine
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })
    -- onedark
   use({
        'navarasu/onedark.nvim',
        config = function()
            require'onedark'.setup {
                transparent = true
            }
            require'onedark'.load()
        end,
    })

    ----- Tresitter plugins -----
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('ThePrimeagen/harpoon')

    --------- Undotree configuration --------- 
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    --------- LSP congiuration --------- 
    use({'neovim/nvim-lspconfig'})
    use({'hrsh7th/nvim-cmp'})
    use({'hrsh7th/cmp-nvim-lsp'})
    use({'hrsh7th/cmp-buffer'})

    -- Next two for easily installing LSPs and configuring them
    use({'williamboman/mason.nvim'})
    use({'williamboman/mason-lspconfig'})

    --------- Autopairs and automaps --------- 
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    use({'windwp/nvim-ts-autotag'})

    --------- Debbuger plugins + nvim-jdtls -----------
    use({'mfussenegger/nvim-dap'})
    use({
        'mfussenegger/nvim-jdtls',
        requires = {
            'mfussenegger/nvim-dap',
        }
    })

    --------- SQL connection support --------- 
    use({"tpope/vim-dadbod"})

    --------- Emmet addition for HTML snippets ---------  
    use({'mattn/emmet-vim'})

    --------- Neotest for inline pass/fails markers ---------  
    use({"nvim-neotest/nvim-nio",})
    use({"rcasia/neotest-java"})
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        }
    }

    --------- Adding Jacoco coverage support to editor ---------  
    use({
        "andythigpen/nvim-coverage",
        requires = "nvim-lua/plenary.nvim",
    } )

end)

