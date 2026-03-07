return {
  "stevearc/conform.nvim",

  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      css = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      astro = { "prettier", "prettierd", stop_after_first = true },
      markdown = { "markdownlint" },
      tex = { "tex-fmt" },
      python = { "isort", "black" },
    },
  },
}
