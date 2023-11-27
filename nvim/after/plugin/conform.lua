require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    go = { "goimports", "gofumpt", "goimports-reviser" },



    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
    css = { { "prettierd", "prettier" } },
    scss = { { "prettierd", "prettier" } },
    html = { { "prettierd", "prettier" } },
    javascriptreact = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    typescriptreact = { { "prettierd", "prettier" } },
    markdown = { { "prettierd", "prettier" } },
    mdx = { { "prettierd", "prettier" } },
    json = { { "prettierd", "prettier" } },
    jsonc = { { "prettierd", "prettier" } },
    bash = { "shfmt" },
    sh = { "shfmt" },
    yaml = { { "prettierd", "prettier" } },
    graphql = { { "prettierd", "prettier" } },
    handlebars = { { "prettierd", "prettier" } },

  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

require("conform").setup({
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

vim.api.nvim_set_keymap('n', '<leader>f', ':Format<CR>', { silent = true })
