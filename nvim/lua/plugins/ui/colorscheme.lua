----------------------------------
----- Monochrome colorscheme -----
----------------------------------
return {
	"andreypopp/vim-colors-plain",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme plain]])
	end,
}
