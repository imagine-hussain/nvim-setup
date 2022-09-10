local utils = require "configs.utils"
local add_cmp_source = utils.add_cmp_source

local plugin_table = {
  -- Plugin management
  ["wbthomason/packer.nvim"] = {},

  -- speed go brrrr
  ["lewis6991/impatient.nvim"] = {},

  -- lua functions stuff - dependency for many plugins
  ["nvim-lua/plenary.nvim"] = {
    module = "plenary"
  },

  -- Popup api
  ["nvim-lua/popup.nvim"] = {},

  -- Indent detection
  ["tpope/vim-sleuth"] = {
    event = { "BufRead", "BufNewFile", "BufEnter" },
    config = function ()
    end,
  },

  -- treesitter syntax highlighting
  ["nvim-treesitter/nvim-treesitter"] = {
    run = ":TSUpdate",
    event = { "BufRead", "BufNewFile" },
    cmd = {
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSDisableAll",
      "TSEnableAll",
    },
    config = function()
      require "configs.treesitter"
    end,
  },

  -- Autoclose and rename html tags
  ["windwp/nvim-ts-autotag"] = {
    after = "nvim-treesitter",
  },

  -- Notification Manager
  ["rcarriga/nvim-notify"] = {
    config = function()
      require "configs.notify"
    end,
  },

  -- UI Component Library
  -- TODO: Configure this - used by neotree (probs others too)
  ["MunifTanjim/nui.nvim"] = {
    module = "nui",
  },


  -- CursorHold bug fix (speed is key)
  ["antoinemadec/FixCursorHold.nvim"] = {
    event = { "BufRead", "BufNewFile" },
    config = function()
      -- Time in ms to update
      vim.g.cursorhold_updatetime = 50 -- default rec 100
    end,
  },

  -- Better way to move splits: moves the "split line"
  ["mrjones2014/smart-splits.nvim"] = {
    module = "smart_splits",
    config = function()
      require "configs.smart_splits"
    end,
  },

  -- Close buffers without destroying the window
  ["famiu/bufdelete.nvim"] = {
    cmd = { "Bdelete", "Bwipeout" },
  },
  -- Bufferline
  ["akinsho/bufferline.nvim"] = {
    config = function()
      require "configs.bufferline"
    end,
  },

  -- Icons
  ["kyazdani42/nvim-web-devicons"] = {
    module = "nvim-web-devicons",
    config = function()
      require "configs.icons"
    end,
  },

  -- Scope Buffers to be Restricted to Tabs: makes bufferline cleaner
  ["tiagovla/scope.nvim"] = {
    config = function()
      require "configs.scope"
    end,
  },

  -- Statusline: TODO:
  ["feline-nvim/feline.nvim"] = {
    config = function()
      require "configs.feline"
    end,
  },

  -- Filtree
  ["nvim-neo-tree/neo-tree.nvim"] = {
    cmd = { "Neotree" },
    module = { "neotree" },
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    setup = function()
      -- Dont actually know what the legacy stuff was, quick setup
      -- recommended adding this
      vim.g.neo_tree_remove_legacy_commands = true
    end,
    config = function()
      require "configs.neotree"
    end,
  },

  -- Use TS to better understand commentstrings
  ["JoosepAlviste/nvim-ts-context-commentstring"] = {
    after = "nvim-treesitter",
    config = function ()
      require "configs.ts-context-commentstring"
    end,
  },

  -- Coloured Highlights for Parenthesis
  ["p00f/nvim-ts-rainbow"] = { after = "nvim-treesitter" },


  --
  -- Snippets
  -- Default Snippet Pack
  ["rafamadriz/friendly-snippets"] = { opt = true },
  -- Actaul Engine
  ["L3MON4D3/LuaSnip"] = {
    module = "luasnip",
    config = function()
      require "configs.luasnip"
    end,
  },
  
  --
  --
  -- autocompletion engine - needed by luasnip and lsp
  -- Configured afterwards
  ["hrsh7th/nvim-cmp"] = {},
  -- Luasnip source for cmp
  ["saadparwaiz1/cmp_luasnip"] = { },
  -- Buffer completion source
  ["hrsh7th/cmp-buffer"] = { },
  -- Path completion source
  ["hrsh7th/cmp-path"] = { },
  -- LSP completion source
  ["hrsh7th/cmp-nvim-lsp"] = { },

  --
  -- Lsp
  --
  -- Built-in LSP
  ["neovim/nvim-lspconfig"] = { event = "VimEnter" },
  -- Lsp Installer
  ["williamboman/nvim-lsp-installer"] = {
    after = "nvim-lspconfig",
    config = function()
      require "configs.nvim-lsp-installer"
      require "configs.lsp"
    end,
  },




  --
  -- Colors
  --
  ["sainnhe/gruvbox-material"] = {
  }
}

local packer_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

local function install_packer()
    vim.fn.delete(packer_path, "rf")
    vim.fn.system {
      "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_path
    }
    vim.api.nvim_echo({"initialising packer"}, false, {})
    vim.cmd "packadd packer.nvim"
end

local function init_packer()
  -- If packer can't be called, then install it
  local packer_available, packer = pcall(require, "packer")
  if not packer_available then
    install_packer()
    -- Try to re-source after install
    packer_available, packer = pcall(require, "packer")
    if not packer_available then
      vim.api.nvim_err_writeln(
        "Failed to load packer at " .. packer_path .. "\n\n" .. packer
      )
    end
  end
  return packer
end


local function init_plugins(packer)
  packer.startup {
    function (use)
      -- use all the plugins if, they haven't been init already
      for key, plugin in pairs(plugin_table) do
        if type(key) == "string" and not plugin[1] then
          plugin[1] = key
        end
        use(plugin)
      end
    end
  }
end

local packer = init_packer()

init_plugins(packer)
require ("configs.cmp")
