-------------------------------------------------------------
----- LINTERS AND EXTERNAL LSP TOOLS ------------------------
-------------------------------------------------------------
return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = {
				-------------------------------------------------------------
				----- Lua formatting tools ----------------------------------
				-------------------------------------------------------------
				null_ls.builtins.formatting.stylua,

				-------------------------------------------------------------
				----- Python formatting tools -------------------------------
				-------------------------------------------------------------
				null_ls.builtins.formatting.black,

				-------------------------------------------------------------
				----- Go formatting tools -----------------------------------
				-------------------------------------------------------------
				null_ls.builtins.formatting.gofmt,

				-------------------------------------------------------------
				----- C formatting tools ------------------------------------
				-------------------------------------------------------------
				null_ls.builtins.formatting.clang_format,

				-------------------------------------------------------------
				----- Bash formatting tools ---------------------------------
				-------------------------------------------------------------
				null_ls.builtins.formatting.shfmt,
			},

			---------------------------------------------------------
			----- Always format files on save -----------------------
			---------------------------------------------------------
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	end,
}
