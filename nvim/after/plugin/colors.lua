function ColorMyPencils(color)
  -- 	color = color or "rose-pine"
  color = color or "tokyonight"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
  vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

  vim.o.guicursor = 'n-v-c:block-Cursor/lCursor'
  vim.api.nvim_command('highlight Cursor guifg=#FFFFFF guibg=#FF0000')
  vim.o.hlsearch = true
  vim.api.nvim_command('highlight Search guifg=#FFFFFF guibg=#')
  -- vim.api.nvim_command('highlight CursorLine guifg=#000000 guibg=#00FFFF')
  vim.api.nvim_command('highlight Visual guifg=#000000 guibg=#00FFFF')
end

