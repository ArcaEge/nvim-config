local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",

    -- Themes
    "rebelot/kanagawa.nvim",
    'rose-pine/neovim',

    {
        'nvim-telescope/telescope.nvim', tg = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'windwp/nvim-ts-autotag',
        }
    },
    { 
        "folke/twilight.nvim", 
        opts = {
            dimming = {
                alpha = 0.25,
                color = { "Normal", "#54546D" },
                term_bg = "#54546D",
            },
            context = 10, -- amount of lines we will try to show around the current line
            treesitter = true,
        }
    },
	'windwp/nvim-autopairs',
	'stevearc/dressing.nvim',
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	"petertriho/nvim-scrollbar",
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup()
		end,
	},
	{ 'echasnovski/mini.nvim', version = false },
	"RRethy/vim-illuminate",
	"nvim-lualine/lualine.nvim",
	'nvim-tree/nvim-web-devicons',
	'mbbill/undotree',
	'tpope/vim-fugitive',

	-- LSP
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},

	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},

    -- GitSigns
    "lewis6991/gitsigns.nvim",

    'karb94/neoscroll.nvim',    -- Smooth scroll
    "folke/zen-mode.nvim",

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    },
    {'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            animation = true,
            insert_at_start = true,
        },
    },
    { 'RaafatTurki/hex.nvim' },

    'tpope/vim-commentary',
})

require ('hex').setup()
require('nvim-autopairs').setup()
require("dressing").setup()
require("scrollbar").setup()
require("lualine").setup()
require("ibl").setup()
require('gitsigns').setup()

require("neo-tree").setup({
    close_if_last_window = true,
    window = {
        width = 30,
        mappings = {
            ["o"] = "system_open",
        },
    },
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
        }
    },
    commands = {
        system_open = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            -- macOs: open file in default application in the background.
            vim.fn.jobstart({ "xdg-open", "-g", path }, { detach = true })
            -- Linux: open file in default application
            vim.fn.jobstart({ "xdg-open", path }, { detach = true })
        end,
    },
    event_handlers = {
        {
            event = "file_opened",
            handler = function(file_path)
                -- auto close
                -- vimc.cmd("Neotree close")
                -- OR
                require("neo-tree.command").execute({ action = "close" })
            end
        },
    },
})
require('neoscroll').setup({
    easing_function = "quadratic"
})

-- ILLUMINATE --
require('illuminate').configure()
-- change the highlight style
vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
--- auto update the highlight style on colorscheme change
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
	pattern = { "*" },
	callback = function(ev)
		vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
	end
})

vim.cmd("Neotree action=close")

require("arca")
