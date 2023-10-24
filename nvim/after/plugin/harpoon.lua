local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

require("harpoon").setup({
    menu = {
      width = 80,
    }
})

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

-- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
-- vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
-- vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
-- vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)

vim.keymap.set("n", "<C-S-P>", function() ui.nav_prev() end)
vim.keymap.set("n", "<C-S-N>", function() ui.nav_next() end)
vim.api.nvim_create_autocmd({ 'filetype' },
  { pattern = 'harpoon',
    callback = function()
      vim.cmd([[highlight HarpoonBorder guifg=#FFFFA5]])
      vim.cmd([[highlight HarpoonWindow guifg=#69FF94]])
    end })
