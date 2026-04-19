return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			default_format_opts = {
				lsp_format = "prefer",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "oxfmt" },
				javascriptreact = { "oxfmt" },
				typescript = { "oxfmt" },
				typescriptreact = { "oxfmt" },
				json = { "oxfmt" },
				vue = { "oxfmt" },
				twig = { "djlint" },
				handlebars = { "djlint" },
				php = { "phpcbf" },
				svelte = {},
				liquid = {},
			},
			formatters = {
				oxfmt = {
					command = "oxfmt",
					args = { "--stdin-filepath", "$FILENAME" },
					stdin = true,
				},
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
