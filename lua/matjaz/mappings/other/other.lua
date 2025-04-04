local function toggle_wrap()
    vim.o.wrap = not vim.o.wrap
end

function get_symbol_under_cursor()
    local params = vim.lsp.util.make_position_params()
    vim.lsp.buf_request(0, 'textDocument/documentSymbol', params, function(err, result, ctx)
        if err or not result then return end
        for _, symbol in ipairs(result) do
            if symbol.range and symbol.range.start.line <= params.position.line and symbol.range["end"].line >= params.position.line then
                return symbol.name
            end
        end
    end)

    return ""
end

local function to_snake_case(str)
    return str:gsub('%f[%u]%u+', string.lower):gsub('%f[%a][%u]', '_%1'):gsub('%s+', '_'):lower()
end

local function rename_to_snake_case()
    local symbol = get_symbol_under_cursor()
    if symbol == "" then
        vim.notify("No symbol found under cursor", vim.log.levels.ERROR)
        return
    end
    local new_symbol = to_snake_case(symbol)
    print(new_symbol)
    vim.lsp.buf.rename(new_symbol)
end

function TestIsThis()
    local params = vim.lsp.util.make_position_params()
    vim.lsp.buf_request_all(0, 'textDocument/rename', params, function(err, result, ctx)
    end)
end

require "matjaz.mappings.set".set_mappings({
    { "tw", toggle_wrap,           desc = "Toggle wrap" },
    { "ts", "<cmd> source % <cr>", desc = "Source" },
    { "tw",          toggle_wrap,           desc = "Toggle wrap" },
    { "ts",          "<cmd> source % <cr>", desc = "Source" },
    { "<leader>gsr", rename_to_snake_case,  desc = "Rename symbol to snake case globaly" },
    { "<leader>gsv", TestIsThis,            desc = "Rename symbol to snake case globaly" },
})

function GetSymbolUnderCursor()
    local params = vim.lsp.util.make_position_params()
    vim.lsp.buf_request(0, 'textDocument/documentSymbol', params, function(err, result, ctx)
        if err or not result then return end
        for _, symbol in ipairs(result) do
            if symbol.range and symbol.range.start.line <= params.position.line and symbol.range["end"].line >= params.position.line then
                print("tejio")
                print(symbol.name)
                return symbol.name
            end
        end
    end)
end

vim.api.nvim_set_keymap('n', '<Leader>sn', ':lua GetSymbolUnderCursor()<CR>', { noremap = true, silent = true })

function GetVariableUnderCursor()
    local params = vim.lsp.util.make_position_params()
    vim.lsp.buf_request(0, 'textDocument/hover', params, function(err, result, ctx)
        if err or not result or not result.contents then return end
        print(result.contents)
        for index, value in ipairs(result.contents) do
            print(index .. " " .. value)
        end
        local contents = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
        if #contents > 0 then
            print(contents[1])
            return contents[1]
        end
    end)
end

require "matjaz.mappings.set".set_mappings({
    { "<leader>vn", GetVariableUnderCursor, desc = "Rename symbol to snake case globaly", mode = "v" },
})
