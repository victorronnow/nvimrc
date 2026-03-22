return {
	"folke/sidekick.nvim",
	-- optional, but recommended if sidekick uses remote backends
	-- dependencies = { "nvim-lua/plenary.nvim" },

	opts = {
		-- Tell sidekick to use Cursor’s CLI as the provider/backend.
		-- (Provider naming can vary by version; see :help sidekick or the README
		-- if this key is called `provider`/`backend` in your installed version.)
		provider = "cursor-cli",

		cursor = {
			-- Path to the Cursor CLI binary. If it's in $PATH, leaving this as "cursor" is fine.
			-- Some installs use `cursor-cli` instead; set whichever exists on your system.
			cmd = "cursor-agent",

			-- If you want to force a model or pass extra flags, add them here.
			-- args = { "--model", "gpt-4.1" },
		},

		-- Quality-of-life defaults (names may vary by version)
		ui = {
			-- open suggestion/result in a split instead of replacing your buffer
			open_in_split = true,
		},

		nes = {
			-- Disable Next Edit Suggestions
			enabled = false,
		},
	},

	config = function(_, opts)
		-- IMPORTANT: sidekick expects setup() to be called
		require("sidekick").setup(opts)
	end,

	-- Example keymaps. Adjust to your taste.
	keys = {
		{
			"<tab>",
			function()
				-- If there is a next edit, jump to it, otherwise apply it if any.
				-- If sidekick didn't handle it, fall back to a normal <Tab>.
				if not require("sidekick").nes_jump_or_apply() then
					return "<Tab>"
				end
			end,
			expr = true,
			desc = "Goto/Apply Next Edit Suggestion",
		},
		{
			"<c-.>",
			function()
				require("sidekick.cli").toggle()
			end,
			desc = "Sidekick Toggle",
			mode = { "n", "t", "i", "x" },
		},
		{
			"<leader>aa",
			function()
				require("sidekick.cli").toggle()
			end,
			desc = "Sidekick Toggle CLI",
		},
		{
			"<leader>as",
			function()
				require("sidekick.cli").select()
			end,
			desc = "Select CLI",
		},
		{
			"<leader>ad",
			function()
				require("sidekick.cli").close()
			end,
			desc = "Detach a CLI Session",
		},
		{
			"<leader>at",
			function()
				require("sidekick.cli").send({ msg = "{this}" })
			end,
			mode = { "x", "n" },
			desc = "Send This",
		},
		{
			"<leader>af",
			function()
				require("sidekick.cli").send({ msg = "{file}" })
			end,
			desc = "Send File",
		},
		{
			"<leader>av",
			function()
				require("sidekick.cli").send({ msg = "{selection}" })
			end,
			mode = { "x" },
			desc = "Send Visual Selection",
		},
		{
			"<leader>ap",
			function()
				require("sidekick.cli").prompt()
			end,
			mode = { "n", "x" },
			desc = "Sidekick Select Prompt",
		},
		{
			"<leader>ac",
			function()
				require("sidekick.cli").toggle({ name = "cursor", focus = true })
			end,
			desc = "Sidekick Toggle Cursor",
		},
	},
}
