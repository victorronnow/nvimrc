return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },
				twig = { "djlint" },
				scss = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
				php = { "phpcbf" },
				svelte = { { "prettierd", "prettier" } },
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
