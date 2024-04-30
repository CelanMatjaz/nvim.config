local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_servers = {
    "lua_ls",
    "cssls",
    "html",
    "clangd",
}

local function check_for_exe_and_append(executable, lsp)
    if vim.fn.executable(executable) == 1 then
        if type(lsp) == "string" then
            table.insert(lsp_servers, lsp)
        elseif type(lsp) == "table" then
            for _, server in pairs(lsp) do
                table.insert(lsp_servers, server)
            end
        end
    end
end

check_for_exe_and_append("go", "gopls")
check_for_exe_and_append("dotnet", "csharp_ls")
check_for_exe_and_append("node", "emmet_ls")
check_for_exe_and_append("rails", "solargraph")
check_for_exe_and_append("php", "intelephense")

require "mason".setup {}
require "mason-lspconfig".setup {
    function(server_name)
        require "lspconfig"[server_name].setup {
            capabilities = capabilities,
            -- on_attach = function(client)
            -- end
        }
    end,
    ensure_installed = lsp_servers,
    automatic_installation = false,
}

return { lsp_servers = lsp_servers }
