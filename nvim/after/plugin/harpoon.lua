local harpoon = require("harpoon")

harpoon:setup()

-- harpoon:extend({
--   UI_CREATE = function(cx)
--     vim.keymap.set("n", "<C-v>", function()
--       harpoon.ui:select_menu_item({ vsplit = true })
--     end, { buffer = cx.bufnr })
--
--     vim.keymap.set("n", "<C-x>", function()
--       harpoon.ui:select_menu_item({ split = true })
--     end, { buffer = cx.bufnr })
--   end,
-- })


vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>",
  function()
    harpoon.ui:toggle_quick_menu(harpoon:list(),
      { border = "rounded", title_pos = "center" })
  end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(0) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

-- vim.api.nvim_create_autocmd({ 'filetype' },
--  {
--    pattern = "harpoon",
--    callback = function()
--      vim.cmd([[highlight HarpoonBorder guifg=#FFFFA5]])
--      vim.cmd([[highlight HarpoonWindow guifg=#69FF94]])
--    end
--  })
