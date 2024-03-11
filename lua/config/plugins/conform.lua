return {
  'stevearc/conform.nvim',
  opts = {},
  config = function ()
      require("conform").setup({
          formatters_by_ft = {
              lua = { "stylua" },
              python = { "isort", "black" },
              javascript = { { "biome" } },
              twig = {{ "djlint" }},
              scss = {{ "prettierd", "prettier" }},
              typescript = {{ "prettierd", "prettier" }},
              php = {{ "prettierd", "prettier" }},
              svelte = {{ "prettierd", "prettier" }},
          },
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*",
          callback = function(args)
              require("conform").format({ bufnr = args.buf })
          end,
      })
  end
}

