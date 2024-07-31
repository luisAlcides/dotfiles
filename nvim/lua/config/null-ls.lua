-- lua/config/null-ls.lua
local null_ls = require("null-ls")

local sources = {
  null_ls.builtins.diagnostics.mypy,
  null_ls.builtins.diagnostics.ruff,
  null_ls.builtins.formatting.black,
}

null_ls.setup({
  sources = sources,
})
