-- Use Lua to confiure tree-sitter
-- https://github.com/nvim-treesitter/nvim-treesitter
require("nvim-treesitter.configs").setup({
    ensure_installed = { "javascript", "typescript", "python", "vim", "json", "html", "java", "tsx", "lua" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
})

