local function change_choice()
	if luasnip.choice_active() then 
		luasnip.change_choice(1) 
	end 
end

return {
	"L3MON4D3/LuaSnip",
	version = "v2.3",
	build = "make install_jsregexp",
	config = function(_, _) 
		local luasnip = require "luasnip"

		require "matjaz.mappings.set".set_mappings({
			{ "<C-K>", function() luasnip.expand() end,                                        desc = "Snippet expand",        mode = { "i" } },
			{ "<C-L>", function() luasnip.jump(1) end,                                         desc = "Snippet jump forward",  mode = { "i", "s" } },
			{ "<C-J>", function() luasnip.jump(-1) end,                                        desc = "Snippet jump backward", mode = { "i", "s" } },
			{ "<C-E>", change_choice , desc = "Snippet change",        mode = { "i", "s" } },
		})
	end
}
