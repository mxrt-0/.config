return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "16color",
			},
			sections = {
				lualine_x = {
					"filetype",
				},
			},
		})
	end,
}
