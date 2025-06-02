------------------------------------
----- Default leader keys ----------
------------------------------------
vim.g.mapleader = " "			  -- map global leader key to spacebar
vim.g.maplocalleader = " "		  -- map local leader key to spacebar
------------------------------------
----- Common options ---------------
------------------------------------
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.completeopt = { 
	"menu", "menuone", "noselect" -- completion behaviour
}					 
vim.opt.mouse = "a"				  -- allow the mouse to be used in Nvim
vim.opt.scrolloff = 10			  -- no less than 10 lines even if you keep scrolling down
------------------------------------
----- Tab options ------------------
------------------------------------
vim.opt.tabstop = 4			      -- number of visual spaces per TAB
vim.opt.softtabstop = 4			  -- number of spacesin tab when editing
vim.opt.shiftwidth = 4			  -- insert 4 spaces on a tab
vim.opt.expandtab = false         -- tabs are spaces, mainly because of python
------------------------------------
----- UI options -------------------
------------------------------------
vim.opt.number = true			  -- show absolute number
vim.opt.relativenumber = true     -- add numbers to each line on the left side
vim.opt.cursorline = true         -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true         -- open new vertical split bottom
vim.opt.splitright = true         -- open new horizontal splits right
vim.opt.termguicolors = true      -- enable 24-bit RGB color in the TUI
vim.opt.showmode = false		  -- no "-- INSERT --" mode hint
------------------------------------
----- Search options ---------------
------------------------------------
vim.opt.incsearch = true	      -- search as characters are entered
vim.opt.hlsearch = false		  -- do not highlight matches
vim.opt.ignorecase = true         -- ignore case in searches by default
vim.opt.smartcase = true          -- but make it case sensitive if an uppercase is entered
------------------------------------
----- Nvim-tree options ------------
------------------------------------
vim.g.loaded_netrw = 1            -- Disable Ntrw, built-in
vim.g.loaded_netrwPlugin = 1	  -- file explorer in Neovim
