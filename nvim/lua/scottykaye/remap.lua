vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- remap vim paste to paste copy
vim.keymap.set("v", "<leader>pc", "p")
-- make pastes actually paste
vim.keymap.set("v", "p", "pgvy")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
  require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
  require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>c", [[:nohlsearch<CR>]])
vim.keymap.set("n", "<S-M-Up>", "<Esc>Vypk")
vim.keymap.set("n", "<S-M-Down>", "<Esc>Vyp")
vim.keymap.set("i", "<S-M-Up>", "<Esc>Vypk")
vim.keymap.set("i", "<S-M-Down>", "<Esc>Vyp")

vim.keymap.set("n", "<M-Up>", "Vyddkkp")
vim.keymap.set("n", "<M-Down>", "Vyddp")
vim.keymap.set("i", "<M-Up>", "<Esc>Vyddkkp")
vim.keymap.set("i", "<M-Down>", "<Esc>Vyddp")

vim.keymap.set("n", "<leader>w", [[:w<CR>]])
vim.keymap.set("n", "<leader>h", [[:/<C-r><C-w><CR>]])
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>ok", [[:%s/\(.*\)/bar\1/g<Left><Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/scottykaye/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>fb",
--   ":Telescope file_browser<CR>",
--   { noremap = true }
-- )

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
  "n",
  "<leader>fb",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)


vim.api.nvim_create_user_command("Cpath", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
  vim.notify('Copied relative path "' .. path .. '" to the clipboard!')
end, {})



vim.api.nvim_create_user_command("Capath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied absolute path "' .. path .. '" to the clipboard!')
end, {})
