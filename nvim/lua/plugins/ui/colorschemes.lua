----------------------------------
----- Monochrome colorschemes ----
----------------------------------
return {
	"ntk148v/komau.vim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.o.background = "light", vim.cmd([[colorscheme komau]])
	end,
}
