if not pcall(io.lines, "/.dockerenv") then
  require("xkbswitch").setup()
end
