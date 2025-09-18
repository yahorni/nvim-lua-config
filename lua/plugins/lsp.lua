return {
  "neovim/nvim-lspconfig",
  dependencies = { "mason-org/mason.nvim" },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { buffer = event.buf, desc = "[C]ode [F]ormat" })

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    local function enable_server_if_present(name, executable)
      if vim.fn.executable(executable or name) == 1 then
        vim.lsp.enable(name)
      end
    end

    enable_server_if_present("clangd")
    enable_server_if_present("lua_ls", "lua-language-server")
    enable_server_if_present("marksman")
    enable_server_if_present("basedpyright")
    enable_server_if_present("tinymist")

    local function switch_header_source()
      local params = { uri = vim.uri_from_bufnr(0) }
      vim.lsp.buf_request(0, "textDocument/switchSourceHeader", params, function(err, result)
        if err then
          vim.notify("Error switching: " .. err.message, vim.log.levels.ERROR)
          return
        end
        if not result then
          vim.notify("No alternate file found", vim.log.levels.WARN)
          return
        end
        local filepath = vim.uri_to_fname(result)
        vim.cmd("edit " .. filepath)
      end)
    end

    vim.keymap.set("n", "<leader>cs", switch_header_source, { desc = "[C]ode [S]witch header/source" })
  end,
}
