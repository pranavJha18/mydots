local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- web development
    css = { "prettierd" },
    html = { "prettierd" },
    javascrpt = { "prettierd" },
    typescript = { "prettierd" },
    tailwindcss = { "rustywind" },
    -- other lnaguages
    c = { "clang_format" },
    cpp = { "clang_format" },
    python = { "black" },
    markdown = { "prettierd" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
