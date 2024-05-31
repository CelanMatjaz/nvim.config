local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_servers = {
    "lua_ls",
    "cssls",
    "html",
    "clangd",
    "jsonls",
}

local ensure_installed_lsp_servers = {}

for k, v in pairs(lsp_servers) do
    ensure_installed_lsp_servers[k] = v
end

local function check_for_exe_and_append(executable, lsps)
    if vim.fn.executable(executable) == 1 and type(lsps) == "table" then
        for _, server in pairs(lsps) do
            if type(server) == "string" then
                table.insert(ensure_installed_lsp_servers, server)
                table.insert(lsp_servers, server)
            else
                if not (type(server) == "table" and server.name) then goto continue end
                table.insert(ensure_installed_lsp_servers, server.name)
                table.insert(lsp_servers, server)
            end

            ::continue::
        end
    else
        if type(lsp) == "string" then
            print("Cannot install lsp server(s) (" .. lsp .. "), no '" .. executable .. "' executable found on system")
        elseif type(lsp) == "table" then
            local str = {}
            for _, server in pairs(lsp) do
                table.insert(str, server)
            end            
            print("Cannot install lsp server(s) (" .. table.concat(str, ", ") .. "), no '" .. executable .. "' executable found on system")
        end
    end
end

-- TODO: Move custom configs to their own files
check_for_exe_and_append("go", { "gopls" })
check_for_exe_and_append("dotnet", { "csharp_ls" })
check_for_exe_and_append("node", { "emmet_ls", "tailwindcss", "tsserver", {
    name = "vtsls",
    custom_config = {
        refactor_auto_rename = true,
        settings = {
            importModuleSpecifier = "project-relative"
        }
    }
} })
check_for_exe_and_append("rails", { "solargraph" })
check_for_exe_and_append("php", { "intelephense" })

require "mason".setup {}
require "mason-lspconfig".setup {
    function(server_name)
        require "lspconfig"[server_name].setup {
            capabilities = capabilities,
            -- on_attach = function(client)
            -- end
        }
    end,
    ensure_installed = ensure_installed_lsp_servers,
    automatic_installation = false,
}

return { lsp_servers = lsp_servers }
