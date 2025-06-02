-------------------------------------------------------------
----- LSP CONFIG --------------------------------------------
-------------------------------------------------------------
return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		-------------------------------------------------------------
		----- Lua language server -----------------------------------
		-------------------------------------------------------------
		lspconfig.lua_ls.setup({})

		-------------------------------------------------------------
		----- Pyhon language server --------------------------------
		-------------------------------------------------------------
		lspconfig.pyright.setup({
			capabilities = capabilities,
			settings = {
				pyright = {
					-- Using Ruff's import organizer
					disableOrganizeImports = true,
				},
			},
		})
		lspconfig.ruff.setup({
			capabilities = capabilities,
		})

		-------------------------------------------------------------
		----- Go language server ------------------------------------
		-------------------------------------------------------------
		lspconfig.gopls.setup({
			capabilities = capabilities,
			settings = {
				gopls = {
					gofumpt = true,
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
					analyses = {
						unusedparams = true,
						shadow = true,
						nilness = true,
						unusedwrite = true,
						unusedvariable = true,
					},
					usePlaceholders = true,
					completeUnimported = true,
					staticcheck = true,
					semanticTokens = true,
				},
			},
		})

		-------------------------------------------------------------
		----- C language server -------------------------------------
		-------------------------------------------------------------
		lspconfig.clangd.setup({
			capabilities = capabilities,
			settings = {
				clangd = {},
			},
		})

		-------------------------------------------------------------
		----- Bash language server ----------------------------------
		-------------------------------------------------------------
		lspconfig.bashls.setup({
			capabilities = capabilities,
			settings = {
				bashls = {},
			},
		})
	end,
}
