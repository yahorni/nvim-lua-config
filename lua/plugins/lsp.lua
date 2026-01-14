return {
  "neovim/nvim-lspconfig",
  dependencies = { { "mason-org/mason.nvim", opts = {} } },

  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        vim.keymap.set("n", "grf", vim.lsp.buf.format, { buffer = event.buf, desc = "[C]ode [F]ormat" })

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

    local function enable_server_if_present(name, executable)
      if vim.fn.executable(executable or name) == 1 then
        vim.lsp.enable(name)
        if name == "clangd" then
          vim.keymap.set("n", "grs", "<cmd>LspClangdSwitchSourceHeader<cr>", { desc = "[S]witch header/source" })
        end
      end
    end

    enable_server_if_present("clangd")
    enable_server_if_present("basedpyright")
    enable_server_if_present("ruff")
    enable_server_if_present("zls")
    enable_server_if_present("lua_ls", "lua-language-server")
    enable_server_if_present("markdown_oxide", "markdown-oxide")
    enable_server_if_present("tinymist")
  end,
}
