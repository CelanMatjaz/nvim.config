local lsp_servers = {
    "cssls",
    "html",
    "clangd",
    "jsonls",
    "pyright",
    "glsl_analyzer",
}

local ensure_installed_lsp_servers = {}

for k, v in pairs(lsp_servers) do
    ensure_installed_lsp_servers[k] = v
end

local function append(lsp)
    if type(lsp) == "string" then
        table.insert(ensure_installed_lsp_servers, lsp)
        table.insert(lsp_servers, lsp)
    else
        if (type(lsp) == "table" and lsp.name) then
            table.insert(ensure_installed_lsp_servers, lsp.name)
            table.insert(lsp_servers, lsp)
        end
    end
end

local function check_for_exe_and_append(executable, lsps)
    if vim.fn.executable(executable) == 1 and type(lsps) == "table" then
        for _, server in pairs(lsps) do
            append(server)
        end
    end
end

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
check_for_exe_and_append("zig", { "zls" })

append({
    name = "lua_ls",
    custom_config = {
        on_init = function(client)
            if client.workspace_folders then
                local path = client.workspace_folders[1].name
                if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
                    return
                end
            end

            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = { version = 'LuaJIT' },
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME
                    }
                }
            })
        end,
        settings = {
            Lua = {}
        }
    }
})

return {
    lsp_servers = lsp_servers,
    ensure_installed_lsp_servers = ensure_installed_lsp_servers
}
