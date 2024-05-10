return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	config = function()
		vim.filetype.add({ extension = { wgsl = "wgsl", fs = "glsl", vs = "glsl" } })

		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"typescript",
				"tsx",
				"html",
				"scss",
				"css",
				"javascript",
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"wgsl",
				"glsl",
			},

			sync_install = false,
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
