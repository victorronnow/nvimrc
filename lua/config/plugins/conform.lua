return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
				html = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
				twig = { "djlint" },
				handlebars = { "djlint" },
				scss = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
				css = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
				typescript = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
				php = { "phpcbf" },
				svelte = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
				liquid = { "prettierd", "prettier", stop_after_first = true },
			},
			formatters = {
				oxfmt = {
					command = "oxfmt",
					args = { "--stdin-filepath", "$FILENAME" },
					stdin = true,
				},
				prettierd = {
					require_cwd = true,
					cwd = require("conform.util").root_file({
						".prettierrc",
						".prettierrc.json",
						".prettierrc.yml",
						".prettierrc.yaml",
						".prettierrc.json5",
						".prettierrc.js",
						".prettierrc.cjs",
						".prettierrc.mjs",
						".prettierrc.toml",
						"prettier.config.js",
						"prettier.config.cjs",
						"prettier.config.mjs",
					}),
				},
				prettier = {
					require_cwd = true,
					cwd = require("conform.util").root_file({
						".prettierrc",
						".prettierrc.json",
						".prettierrc.yml",
						".prettierrc.yaml",
						".prettierrc.json5",
						".prettierrc.js",
						".prettierrc.cjs",
						".prettierrc.mjs",
						".prettierrc.toml",
						"prettier.config.js",
						"prettier.config.cjs",
						"prettier.config.mjs",
					}),
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
