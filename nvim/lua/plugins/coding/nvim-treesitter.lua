return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function () 
		require("nvim-treesitter").setup({
			ensure_installed = { 
				"c", 
				"lua", 
				"vim", 
				"vimdoc", 
				"rust", 
				"go", 
				"cpp", 
				"javascript", 
				"html", 
				"python" 
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },  
		})
	end
}

