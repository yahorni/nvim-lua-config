return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },

    -- completion
    'saghen/blink.cmp',
  },

  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(event)
        -- [[ Configure LSP ]]
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- https://neovim.io/doc/user/lsp.html#_lua-module:-vim.lsp.buf

        map('gr', require('fzf-lua').lsp_references, '[G]oto [R]eferences') -- vim.lsp.buf.references
        map('gd', require('fzf-lua').lsp_definitions, '[G]oto [D]efinitions') -- vim.lsp.buf.definition
        map('gD', require('fzf-lua').lsp_declarations, '[G]oto [D]eclarations') -- vim.lsp.buf.declaration
        map('gI', require('fzf-lua').lsp_implementations, '[G]oto [I]mplementations') -- vim.lsp.buf.implementation
        map('gy', require('fzf-lua').lsp_typedefs, '[G]oto T[y]pe Definition') -- vim.lsp.buf.type_definition
        map('<leader>ds', require('fzf-lua').lsp_document_symbols, '[D]ocument [S]ymbols') -- vim.lsp.util.symbols_to_items
        map('<leader>ca', require('fzf-lua').lsp_code_actions, '[C]ode [A]ction') -- vim.lsp.buf.code_action,
        map('<leader>cf', vim.lsp.buf.format, '[C]ode [F]ormat')
        map('<leader>cl', require('fzf-lua').lsp_finder, '[C]ombined view of all LSP [L]ocations')
        map('<leader>dd', require('fzf-lua').diagnostics_document, '[D]ocument [D]iagnostics')
        map('<leader>cR', vim.lsp.buf.rename, '[C]ode [R]ename')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        map('<leader>k', vim.lsp.buf.signature_help, 'Signature Documentation')

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities())

    -- LSP servers list
    local servers = {
      -- setup: https://www.lazyvim.org/extras/lang/clangd
      clangd = {},
      -- gopls = {},
      cmake = {},
      -- able to run with nodejs 16 (default on ubuntu_18: nodejs 8)
      -- pyright = {},
      basedpyright = {},
      -- markdown notes
      marksman = {},

      lua_ls = {
        settings = {
          Lua = {
            completion = { callSnippet = 'Replace' },
            telemetry = { enable = false },
          },
        },
      },
    }

    -- Ensure the servers and tools above are installed
    require('mason').setup()
    require('mason-lspconfig').setup {
      ensure_installed = vim.tbl_keys(servers),
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
        ['clangd'] = function()
          require('lspconfig').clangd.setup {
            on_attach = function(_, bufnr)
              vim.keymap.set('n', '<leader>o', '<cmd>ClangdSwitchSourceHeader<cr>', { buffer = bufnr, desc = 'Switch Source/Header (C/C++)' })
            end,
          }
        end,
      },
    }
  end,
}
