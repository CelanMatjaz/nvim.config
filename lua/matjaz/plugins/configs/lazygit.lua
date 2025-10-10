return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
	dependencies = { "nvim-lua/plenary.nvim", },
	keys = { { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" } },
	config = function ()
		require "matjaz.mappings.set".set_mappings({
			{ "<cmd> LazyGit <cr>",            "<leader>lg", mode = "n", desc = "Lazygit" },
			{ "<cmd> LazyGitCurrentFile <cr>", "<leader>lf", mode = "n", desc = "Lazygit current file" },
		})
	end
}
