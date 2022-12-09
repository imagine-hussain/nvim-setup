-- Mapping object; Will be merged in as mappings with utils.apply_mappings,
-- which uses  `vim.keymap.set`
local maps = { n = {}, v = {}, i = {}, t = {}, [""] = {}, };

-- Leader
maps[""]["<Space>"] = "<Nop>"
utils.print_err("in map")

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


utils.apply_mappings(maps)
