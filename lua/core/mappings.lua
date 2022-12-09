local maps = { n = {}, v = {}, i = {}, t = {}, [""] = {}, };

-- Leader
maps[""]["<Space>"] = "<Nop>"

-- QOL Defaults
maps.n["<leader>w"] = "<cmd>w<CR>"
maps.n["<leader>q"] = "<cmd>q<CR>"
maps.n["<leader>h"] = "<cmd>nohlsearch<CR>"

maps.n["<C-s>"] = "<cmd>w!<CR>"
maps.n["<C-q>"] = "<cmd>q!<CR>"
maps.n["Q"] = "<Nop>"

utils.apply_mappings(maps)
