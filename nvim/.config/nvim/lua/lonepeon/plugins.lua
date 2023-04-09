vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})

return require('packer').startup({
  function(use)
    -- Package Manager
    use('wbthomason/packer.nvim')

    -- Required plugins
    use('nvim-lua/plenary.nvim')

    -- Treesitter: Better Highlights
    use({
      {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
          require('lonepeon.plugins.treesitter')
        end
      },
      { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
    })

    -- Theme
    use({
       'Mofiqul/vscode.nvim',
       config = function()
         require('lonepeon.plugins.vscode')
       end
     })

    -- Editing and Navigation
    use({'gpanders/editorconfig.nvim'})

    use({
      'tpope/vim-surround',
      event = 'BufRead',
      requires = {{ 'tpope/vim-repeat', event = 'BufRead', }}
    })

    use({
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    })


    use({'tpope/vim-eunuch'})

    use({
      'chaoren/vim-wordmotion',
      config = function()
        vim.g.wordmotion_prefix = 'g'
      end
    })

    use({ 'nvim-telescope/telescope.nvim',
      requires={{'nvim-lua/plenary.nvim'}},
      config = function()
        require('lonepeon.plugins.telescope')
      end,
    })

    use({ 'wellle/targets.vim', event = 'BufRead' })

    use {
      'nvim-neotest/neotest',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        'antoinemadec/FixCursorHold.nvim',
        "nvim-neotest/neotest-go",
        'rouge8/neotest-rust',

      },
      config = function()
        require('lonepeon.plugins.neotest')
      end,
    }


    -- LSP, Completions and Snippet
    use({
      'neovim/nvim-lspconfig',
      event = 'BufRead',
      config = function()
        require('lonepeon.plugins.lsp-servers')
      end,
      requires = {{ 'hrsh7th/cmp-nvim-lsp' }}
    })

    use({
      {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        config = function()
          require('lonepeon.plugins.nvim-cmp')
        end,
        requires = {
          {
            'L3MON4D3/LuaSnip',
            event = 'InsertEnter',
            config = function()
              require('lonepeon.plugins.luasnip')
            end,
          },
        },
      },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    })
  end
})
