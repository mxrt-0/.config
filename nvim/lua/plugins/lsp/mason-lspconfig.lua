-------------------------------------------------------------
----- MASON LSP BRIDGE ------------------------------------------
-------------------------------------------------------------
return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"gopls",
				"clangd",
				"bashls",
			},
			automatic_enable = true,
		})
	end,
}
