return {
	"stevearc/oil.nvim",
	config = function(_, _)
		local oil = require "oil"
		oil.setup {
			view_options = {
				show_hidden = true
			},
			columns = {
				"icon",
				"size",
				"mtime",
				"git_status"
			}
		}

		require "matjaz.mappings.set".set_mappings({
			{ "-", "<cmd> Oil <cr>", mode = "n" },
		})
	end
}
