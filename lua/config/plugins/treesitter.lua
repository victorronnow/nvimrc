return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",

	config = function()
		vim.filetype.add({
			extension = { wgsl = "wgsl", fs = "glsl", vs = "glsl", njk = "html", hbs = "handlebars" },
		})

		require("nvim-treesitter").install({
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
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"typescript",
				"typescriptreact",
				"javascript",
				"javascriptreact",
				"html",
				"scss",
				"css",
				"c",
				"lua",
				"vim",
				"help",
				"query",
				"wgsl",
				"glsl",
			},
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
