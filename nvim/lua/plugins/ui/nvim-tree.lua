-----------------------------------------------------
----- FILE EXPLORER WITH TREE STRUCTURE -------------
-----------------------------------------------------
return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
			renderer = {
				icons = {
					show = {
						git = true,
						file = false,
						folder = false,
						folder_arrow = true,
					},
					glyphs = {
						folder = {
							arrow_closed = "⏵",
							arrow_open = "⏷",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "⌥",
							renamed = "➜",
							untracked = "★",
							deleted = "⊖",
							ignored = "◌",
						},
					},
				},
			},
		})
		-----------------------------------------------------
		----- Remove tildas from empty buffers --------------
		-----------------------------------------------------
		vim.opt.fillchars = { eob = " " }
	end,
}
