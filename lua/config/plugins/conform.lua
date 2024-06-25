return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "biome", { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },
				twig = { "djlint" },
				scss = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
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
