return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        texlab = {
          settings = {
            texlab = {
              diagnostics = {
                ignoredPatterns = {
                  -- Rust regexes. match the diagnostic text you want to suppress
                  [[Underfull \\hbox]],
                  -- if you want to be extra broad:
                  -- [[Underfull \\hbox.*]]
                },
              },
            },
          },
        },
      },
    },
  },
}
