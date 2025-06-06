----------------------------------------------------------------
----- Default options ------------------------------------------
----------------------------------------------------------------
local opts = {
	noremap = true,
	silent = true,
}
----------------------------------------------------------------
----- Set system clipboard -------------------------------------
----------------------------------------------------------------
vim.keymap.set("n", "y", '"+y')
vim.keymap.set("n", "yy", '"+yy')
vim.keymap.set("n", "Y", '"+Y')
vim.keymap.set("x", "y", '"+y')
vim.keymap.set("x", "Y", '"+Y')
----------------------------------------------------------------
----- Disable arrow keys ---------------------------------------
----------------------------------------------------------------
vim.keymap.set("n", "<Up>", "<Nop>", opts)
vim.keymap.set("n", "<Down>", "<Nop>", opts)
vim.keymap.set("n", "<Left>", "<Nop>", opts)
vim.keymap.set("n", "<Right>", "<Nop>", opts)

vim.keymap.set("i", "<Up>", "<Nop>", opts)
vim.keymap.set("i", "<Down>", "<Nop>", opts)
vim.keymap.set("i", "<Left>", "<Nop>", opts)
vim.keymap.set("i", "<Right>", "<Nop>", opts)

vim.keymap.set("v", "<Up>", "<Nop>", opts)
vim.keymap.set("v", "<Down>", "<Nop>", opts)
vim.keymap.set("v", "<Left>", "<Nop>", opts)
vim.keymap.set("v", "<Right>", "<Nop>", opts)
----------------------------------------------------------------
----- Nvim-tree keybindings ------------------------------------
----------------------------------------------------------------
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<c-h>", "<c-w>h", opts)
vim.keymap.set("n", "<c-j>", "<c-w>j", opts)
vim.keymap.set("n", "<c-k>", "<c-w>k", opts)
vim.keymap.set("n", "<c-l>", "<c-w>l", opts)
----------------------------------------------------------------
----- Bufferline keybindings -----------------------------------
----------------------------------------------------------------
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<S-tab>", ":BufferLineCyclePrev<CR>", opts)
----------------------------------------------------------------
----- Telescope keybindings ------------------------------------
----------------------------------------------------------------
local builtin = require("telescope.builtin")
local function telescope_find_path(dir_path)
	return function()
		builtin.find_files({
			search_dirs = { vim.fn.expand(dir_path) },
			find_command = { "find", ".", "-type", "f", "-print" },
			theme = "ivy",
		})
	end
end

local root = "/"
local home = "~"
local config = "~/.config"
local projects = "~/projects"

vim.keymap.set("n", "<leader>fr", telescope_find_path(root), opts)
vim.keymap.set("n", "<leader>fh", telescope_find_path(home), opts)
vim.keymap.set("n", "<leader>fc", telescope_find_path(config), opts)
vim.keymap.set("n", "<leader>fp", telescope_find_path(projects), opts)
