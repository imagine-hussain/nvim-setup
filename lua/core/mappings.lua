-- Mapping object; Will be merged in as mappings with utils.apply_mappings,
-- which uses  `vim.keymap.set`
local maps = { n = {}, v = {}, i = {}, t = {}, [""] = {}, };
local exists = utils.plugin_exists

-- Leader
maps[""]["<Space>"] = "<Nop>"

-- QOL Defaults
maps.n["<leader>w"] = { "<cmd>w<CR>" }
maps.n["<leader>q"] = { "<cmd>q<CR>" }
maps.n["<leader>h"] = { "<cmd>nohlsearch<CR>" }

maps.n["<C-s>"] = { "<cmd>w!<CR>" }
maps.n["<C-q>"] = { "<cmd>q!<CR>" }
maps.n["Q"] = { "<Nop>" }

-- Normal mode MacOs-like keybindings
maps.i["<c-f>"] = { "<Right>"  }
maps.i["<c-b>"] = { "<Left>" }

-- Packer
maps.n["<leader>pc"] = { "<cmd>PackerCompile<cr>" }
maps.n["<leader>pi"] = { "<cmd>PackerInstall<cr>" }
maps.n["<leader>ps"] = { "<cmd>PackerSync<cr>" }
maps.n["<leader>pS"] = { "<cmd>PackerStatus<cr>" }
maps.n["<leader>pu"] = { "<cmd>PackerUpdate<cr>" }

-- Buffer Deletion: Using BufDelete to not mess up window management
maps.n["<leader>c"] = { "<cmd>Bdelete<cr>" }

-- Bufferline - move between buffers
maps.n["<S-l>"] = { "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer tab" }
maps.n["<S-h>"] = { "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer tab" }
maps.n[">b"] = { "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer tab right" }
maps.n["<b"] = { "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer tab left" }
-- Default vim version: use in case of emergency (bufferline broke)
-- maps.n["<S-l>"] = { "<cmd>bnext<cr>", desc = "Next buffer" }
-- maps.n["<S-h>"] = { "<cmd>bprevious<cr>", desc = "Previous buffer" }


-- Navigate Tabs
maps.n["<leader>tn"] = { "<cmd>tabnew<cr>", desc = "New tab" }
maps.n["<leader>tc"] = { "<cmd>tabclose<cr>", desc = "Close tab" }

-- Comment (using Comment.nvim)
maps.n["<leader>/"] = {
    function()
        require("Comment.api").toggle.linewise()
    end,
}
maps.v["<leader>/"] = {
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
}

-- Neotree
maps.n["<leader>E"] = { "<cmd>Neotree left<cr>", desc = "Toggle Explorer" }
maps.n["<leader>O"] = { "<cmd>Neotree float<cr>", desc = "Toggle Explorer" }
maps.n["<leader>e"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" }
maps.n["<leader>o"] = { "<cmd>Neotree focus<cr>", desc = "Focus Explorer" }

utils.apply_mappings(maps)