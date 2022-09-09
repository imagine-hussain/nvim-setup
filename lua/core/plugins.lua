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

  -- Notification Manager
  ["rcarriga/nvim-notify"] = {
    config = function()
      require "configs.notify"
    end,
  },

  -- UI Component Library
  -- TODO: Configure this
  -- ["MunifTanjim/nui.nvim"] = {
  --   config = function()
  --     require "configs.nui"
  --   end,
  -- },


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


  --
  -- Colors
  --
  ["sainnhe/gruvbox-material"] = {
    -- config = function()
    --   require "configs.colours"
    -- end,
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