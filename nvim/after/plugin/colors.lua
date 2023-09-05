function ColorMyPencils(color)
  color = color or "rose-pine"
  --  color = color or "tokyonight"
  vim.cmd.colorscheme(color)
  --  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  --  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  vim.opt.laststatus = 2 -- Or 3 for global statusline
  vim.opt.statusline = " %f %m %= %l:%c ♥ "
  -- vim.opt.guicursor="n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"
  vim.opt.guicursor = 'n-v-c:block-Cursor/lCursor'
  vim.opt.cursorline = true
  --  vim.opt.guicursor = ""
  vim.o.hlsearch = true

  -- vim.api.nvim_command('highlight Cursor guifg=#000000 guibg=#9533FF')
  -- vim.api.nvim_command('highlight Search guifg=#000000 guibg=#FF3395')
  -- vim.api.nvim_command('highlight Visual guifg=#000000 guibg=#CCFF33')
end
