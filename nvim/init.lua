if vim.fn.has("nvim-0.10") == 0 then
	vim.api.nvim_echo({
		{ "Requires Neovim >= 0.10.0\n", "ErrorMsg" },
		{ "Press any key to exit", "MoreMsg" },
	}, true, {})
	vim.fn.getchar()
	vim.cmd.quit()
end

-- config
require("config.keymap")
require("config.option")
require("config.lazy")
