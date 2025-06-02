local M = {}

-----------------------------------------------------------------
----- Bootstrap lazy.nvim ---------------------------------------
-----------------------------------------------------------------
function M.bootstrap()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not (vim.uv or vim.loop).fs_stat(lazypath) then
		local lazyrepo = "https://github.com/folke/lazy.nvim.git"
		local out = vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"--branch=stable",
			lazyrepo,
			lazypath
		})
		if vim.v.shell_error ~= 0 then
			vim.api.nvim_echo({
				{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
				{ out,                            "WarningMsg" },
				{ "\nPress any key to exit..." },
			}, true, {})
			vim.fn.getchar()
			os.exit(1)
		end
	end

	vim.opt.rtp:prepend(lazypath)
end

----------------------------------------------------------------
----- Generate plugins list for import -------------------------
----------------------------------------------------------------
function M.generate_plugins_list()
	local plugins = {}
	local uv = vim.loop

	local function add_plugins_from_dir(path)
		local dir_path = vim.fn.stdpath("config") .. "/lua/" .. path
		local dir = uv.fs_opendir(dir_path, nil, 1000)
		if not dir then return end

		while true do
			local entries = uv.fs_readdir(dir)
			if not entries then break end

			for _, entry in ipairs(entries) do
				local full_path = path .. "/" .. entry.name
				if entry.type == "directory" then
					add_plugins_from_dir(full_path)
				elseif entry.type == "file"
					and entry.name:sub(-4) == ".lua"
					and entry.name ~= "init.lua" then
					local import_path = full_path:gsub("%.lua$", ""):gsub("/", ".")
					table.insert(plugins, { import = import_path })
				end
			end
		end

		uv.fs_closedir(dir)
	end

	add_plugins_from_dir("plugins")
	return plugins
end

----------------------------------------------------------------
----- Do all the stuff -----------------------------------------
----------------------------------------------------------------
M.bootstrap()
require("lazy").setup(M.generate_plugins_list())
