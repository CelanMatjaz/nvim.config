local plugins = { }

local function add_plugins(plugin_array) 
	for _, plugin in pairs(plugin_array) do
		table.insert(plugins, plugin)
	end
end

local function add_plugins_if_executables_exist(executables, plugin_array)
	local check_for_any_executable = function(executables_array)
		for _, exe in pairs(executables_array) do
			if vim.fn.executable(exe) == 1 then
				return true
			end
		end
	end

	if check_for_any_executable(executables) then
		add_plugins(plugin_array)
	end
end

add_plugins(require "matjaz.plugins.plugins_common")
add_plugins(require "matjaz.plugins.color_themes")

add_plugins_if_executables_exist({ "rails" }, { { "tpope/vim-rails" } })
add_plugins_if_executables_exist({ "node", "deno" }, { { "mattn/emmet-vim" } })

return plugins
