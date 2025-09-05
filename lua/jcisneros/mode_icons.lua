vim.o.statusline = "%{%v:lua.ModeSymbol()%} %f %y %m %= %l:%c"

function ModeSymbol()
  local mode = vim.api.nvim_get_mode().mode
  local symbols = {
    n = "🅝", -- Normal
    i = "🅘", -- Insert
    v = "🅥", -- Visual
    V = "🅥", -- Visual Line
    [""] = "🅑", -- Visual Block
    c = "🅒", -- Command
    R = "🅡", -- Replace
    t = "🅣", -- Terminal
  }
  return symbols[mode] or "❓"
end
