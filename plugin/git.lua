local m = require("gitsigns")
m.setup({
  on_attach = function(bufnr)
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- navigation
    map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            m.nav_hunk("next")
          end
        end, { desc = "jump to next git [c]hange" })

    map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            m.nav_hunk("prev")
          end
        end, { desc = "jump to previous git [c]hange" })

    -- visual mode actions
    map("x", "<localleader>gs", function() m.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
        { desc = "[g]it [s]tage hunk" })
    map("x", "<localleader>gr", function() m.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
        { desc = "[g]it [r]eset hunk" })

    -- normal mode actions
    map("n", "<localleader>gs", m.stage_hunk, { desc = "[g]it [s]tage hunk" })
    map("n", "<localleader>gr", m.reset_hunk, { desc = "[g]it [r]eset hunk" })
    map("n", "<localleader>gS", m.stage_buffer, { desc = "[g]it [S]tage buffer" })
    map("n", "<localleader>gu", m.undo_stage_hunk, { desc = "[g]it [u]ndo stage hunk" })
    map("n", "<localleader>gR", m.reset_buffer, { desc = "[g]it [R]eset buffer" })
    map("n", "<localleader>gp", m.preview_hunk, { desc = "[g]it [p]review hunk" })
    map("n", "<localleader>gb", m.blame_line, { desc = "[g]it [b]lame line" })
    map("n", "<localleader>gB", m.blame, { desc = "[g]it [B]lame file" })
    map("n", "<localleader>gd", m.diffthis, { desc = "[g]it [d]iff against index" })
    map("n", "<localleader>gD", function() m.diffthis("HEAD^") end, { desc = "[g]it [D]iff against last commit" })

    -- toggles
    map("n", "<localleader>gtb", m.toggle_current_line_blame, { desc = "[g]it [t]oggle [b]lame" })
    map("n", "<localleader>gtd", m.toggle_deleted, { desc = "[g]it [t]oggle [d]eleted" })
  end,
})
