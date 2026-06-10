local function change_choice()
	local luasnip = require "luasnip"
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end

return {
	"L3MON4D3/LuaSnip",
	version = "v2.3",
	build = "make install_jsregexp",
	config = function(_, _)
		local ls = require "luasnip"
		ls.setup {}

		require "matjaz.mappings.set".set_mappings({
			{ "<C-K>", function() ls.expand() end, desc = "Snippet expand",        mode = { "i" } },
			{ "<C-L>", function() ls.jump(1) end,  desc = "Snippet jump forward",  mode = { "i", "s" } },
			{ "<C-J>", function() ls.jump(-1) end, desc = "Snippet jump backward", mode = { "i", "s" } },
			{ "<C-E>", change_choice,              desc = "Snippet change",        mode = { "i", "s" } },
		})

		require "luasnip.loaders.from_lua".load({ paths = "~/.config/nvim/lua/matjaz/snippets/default" })
		require "luasnip.loaders.from_lua".load({ paths = "~/.config/nvim/lua/matjaz/snippets/custom" })
	end

}
