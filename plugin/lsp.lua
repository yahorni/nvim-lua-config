require("mason").setup()

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if not client then return end

    -- highlight object on cursor hold/move
    if client:supports_method("textDocument/documentHighlight") then
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end

    -- omnifunc completion
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, event.buf)
    end

    -- formatting
    if client:supports_method("textDocument/formatting") then
      vim.keymap.set("n", "grf", vim.lsp.buf.format, { buffer = event.buf, desc = "LSP [f]ormat file" })
    end
    if client:supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", "grf", vim.lsp.buf.format, { buffer = event.buf, desc = "LSP [f]ormat range" })
    end
  end,
})

local function enable_server_if_present(name, executable)
  if vim.fn.executable(executable or name) == 1 then
    vim.lsp.enable(name)
    if name == "clangd" then
      vim.keymap.set("n", "grs", "<Cmd>LspClangdSwitchSourceHeader<CR>", { desc = "LSP [s]witch header/source" })
    elseif name == "markdown_oxide" then
      vim.keymap.set("n", "grs", vim.lsp.buf.references, { desc = "LSP list [r]eference[s]" })
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
