return {
	"ggandor/leap.nvim",
	dependencies = { "tpope/vim-repeat" },
	config = function()
		local leap = require "leap"
		leap.setup {}

		leap.set_default_mappings()

		require "matjaz.mappings.set".set_mappings({
			{ "s", "<Plug>(leap-forward)", { desc = "Leap" }, mode = { 'n', 'x', 'o' } },
			{ "S", "<Plug>(leap-backward)", { desc = "Leap" }, mode = { 'n', 'x', 'o' } },
			{ "gs", "<Plug>(leap-from-window)", { desc = "Leap" }, mode = { 'n', 'x', 'o' } },
		})
	end
}
