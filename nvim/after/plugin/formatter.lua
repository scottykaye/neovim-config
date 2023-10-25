local format = require("formatter")

local prettier = function()
  return {
    exe = "./node_modules/.bin/prettier",
    args = {"--stdin-filepath", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
    stdin = true,
  }
end

local eslint = function()
  return {
    exe = "eslint",
    args = {"--stdin", "--stdin-filename", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--fix-to-stdout"},
    stdin = true
  }
end

format.setup {
  logging = false,
  filetype = {
    css = { prettier },
    scss = { prettier },
    html = { prettier },
    javascript = { prettier },
    javascriptreact = { prettier },
    typescript = { prettier },
    typescriptreact = { prettier },
    markdown = { prettier },
    json = { prettier },
    jsonc = { prettier },
    -- html = {
    --   -- html-beutify for better html indentation
    --   function()
    --     return {
    --       exe = "html-beautify",
    --       args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
    --       stdin = true,
    --     }
    --   end,
    -- },
    lua = {
      -- stylua
      function()
        return {
          exe = "stylua",
          args = { "--config-path", "~/.config/.stylua.toml", "-" },
          stdin = true,
        }
      end,
    },
  },
}

-- format on save
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]],
  true
)

vim.api.nvim_set_keymap('n', '<leader>f', ':Format<CR>', { silent = true })
