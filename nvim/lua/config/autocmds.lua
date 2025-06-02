----------------------------------------------------------
----- Disable deprecated messages ------------------------
----------------------------------------------------------
vim.deprecate = function() end

----------------------------------------------------------
----- Trim trailing whitespace on save -------------------
----------------------------------------------------------
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

----------------------------------------------------------
----- Enable spellcheck for markdown and text files ------
----------------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text" },
	command = "setlocal spell",
})
