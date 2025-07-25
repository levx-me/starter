require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd
--
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt.shiftwidth = 4
        vim.opt.tabstop = 4
        vim.opt.softtabstop = 4
        vim.opt.ignorecase = false
        vim.opt.mouse = "a"
    end,
})
autocmd("BufWritePre", {
    pattern = "*.sol",
    command = "silent! !forge fmt",
})
autocmd("BufWritePre", {
    pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" },
    command = "LspEslintFixAll",
})
autocmd("InsertLeave", {
    pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" },
    command = "silent! LspEslintFixAll",
})
