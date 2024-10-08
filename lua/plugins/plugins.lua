local plugins = {

    {
        'stevearc/conform.nvim',
        opts = {},
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },

    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
    },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        keys = { "<leader>", "<c-r>", "<c-w>", "\"", "'", "`", "c", "v", "g" },
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function(_, opts)
            require("which-key").setup(opts)
        end,
        dependencies = {"nvim-tree/nvim-web-devicons", "echasnovski/mini.icons"}
    },

    {
        "nvim-treesitter/nvim-treesitter",
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        dependencies = {
            "windwp/nvim-ts-autotag"
        }
    },

    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons"
    },

    -- {
    --     "zootedb0t/citruszest.nvim",
    --     lazy = false,
    --     init = function(_, opts)
    --         vim.cmd[[colorscheme citruszest]]
    --     end
    -- },

    {
        "sekke276/dark_flat.nvim",
        lazy = false,
        init = function(_, opts)
            vim.cmd [[colorscheme dark_flat]]
        end
    },

    -- {
    --     "fenetikm/falcon",
    --     lazy = false,
    --     init = function(_, opts)
    --         vim.cmd[[colorscheme falcon]]
    --     end
    -- },

    {
        "stevearc/oil.nvim",
        config = function(_, opts)
            require("oil").setup({ view_options = { show_hidden = true } })
            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end
    },

    {
        "williamboman/mason.nvim",
        config = function(_, opts)
            require("mason").setup(opts)
        end
    },

    {
        "williamboman/mason-lspconfig.nvim"
    },

    {
        "neovim/nvim-lspconfig"
    },

    {
        "nvimtools/none-ls.nvim"
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                -- snippet plugin
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                opts = { history = true, updateevents = "TextChanged,TextChangedI" },
            },

            -- autopairing of (){}[] etc
            {
                "windwp/nvim-autopairs",
                opts = {
                    fast_wrap = {},
                    disable_filetype = { "TelescopePrompt", "vim" },
                },
                config = function(_, opts)
                    require("nvim-autopairs").setup(opts)

                    -- setup cmp for autopairs
                    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
            },

            -- cmp sources plugins
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
            },
        },
        config = function(_, opts)
            require("cmp").setup(opts)
        end,
    },

    {
        "numToStr/Comment.nvim",
        opts = {
            -- add any options here
        },
        lazy = false,
    },

    {
        "nvim-tree/nvim-tree.lua",
    },

    {
        "christoomey/vim-tmux-navigator",
    },

    -- Debugging
    {
        "mfussenegger/nvim-dap",
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = { 'nvim-neotest/nvim-nio' }
    },

    {
        "ldelossa/nvim-dap-projects",
        init = function()
            require "nvim-dap-projects".config_paths = { ".nvim/nvim-dap.lua" }
            require "nvim-dap-projects".search_project_config()
        end
    },

    {
        "smithbm2316/centerpad.nvim"
    },

    {
        "mattn/emmet-vim"
    },

    {
        "rafamadriz/friendly-snippets"
    },

    {
        "yioneko/nvim-vtsls"
    },
}

function add_plugins_if_executable_exists(executable, plugin_array)
    if vim.fn.executable(executable) == 1 then
        for _, plugin in pairs(plugin_array) do
            table.insert(plugins, plugin)
        end
    end
end

add_plugins_if_executable_exists("rails", { { "tpope/vim-rails" } })
add_plugins_if_executable_exists("node", { { "mattn/emmet-vim" } })

return plugins
