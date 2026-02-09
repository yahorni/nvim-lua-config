return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "]c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gitsigns.nav_hunk("next")
            end
          end, { desc = "Jump to next git [c]hange" })

      map("n", "[c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "[c", bang = true })
            else
              gitsigns.nav_hunk("prev")
            end
          end, { desc = "Jump to previous git [c]hange" })

      -- Actions
      -- visual mode
      map("v", "<localleader>gs",
          function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
          { desc = "[g]it [s]tage hunk" })
      map("v", "<localleader>gr",
          function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
          { desc = "[g]it [r]eset hunk" })
      -- normal mode
      map("n", "<localleader>gs", gitsigns.stage_hunk, { desc = "[g]it [s]tage hunk" })
      map("n", "<localleader>gr", gitsigns.reset_hunk, { desc = "[g]it [r]eset hunk" })
      map("n", "<localleader>gS", gitsigns.stage_buffer, { desc = "[g]it [S]tage buffer" })
      map("n", "<localleader>gu", gitsigns.undo_stage_hunk, { desc = "[g]it [u]ndo stage hunk" })
      map("n", "<localleader>gR", gitsigns.reset_buffer, { desc = "[g]it [R]eset buffer" })
      map("n", "<localleader>gp", gitsigns.preview_hunk, { desc = "[g]it [p]review hunk" })
      map("n", "<localleader>gb", gitsigns.blame_line, { desc = "[g]it [b]lame line" })
      map("n", "<localleader>gB", gitsigns.blame, { desc = "[g]it [B]lame file" })
      map("n", "<localleader>gd", gitsigns.diffthis, { desc = "[g]it [d]iff against index" })
      map("n", "<localleader>gD", function() gitsigns.diffthis("HEAD^") end,
          { desc = "[g]it [D]iff against last commit" })

      -- Toggles
      map("n", "<localleader>gtb", gitsigns.toggle_current_line_blame, { desc = "[g]it [t]oggle [b]lame" })
      map("n", "<localleader>gtd", gitsigns.toggle_deleted, { desc = "[g]it [t]oggle [d]eleted" })
    end,
  },
}
