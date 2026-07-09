vim.pack.add({ "https://github.com/folke/trouble.nvim" })

local trouble = require("trouble")
trouble.setup({})

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
