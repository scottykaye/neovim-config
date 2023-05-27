require("scottykaye.remap")
print("Hello from ScottyKaye")
vim.cmd('set tabstop=2')
vim.cmd([[
  augroup LuaFormatting
    autocmd!
    autocmd FileType lua setlocal shiftwidth=2 expandtab tabstop=2
  augroup END
]])
