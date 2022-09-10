local status_ok, luasnip = require("luasnip")
local loader_ok, loader = pcall(require, "luasnip/loaders/from_vscode")

-- To load vscode-style snippets
if loader_ok then
    loader.lazy_load()
end

if status_ok then
    -- TODO: Loop over all files in `configs/luasnip` and extend
    -- them with `luasnip.filetype_extend(filetype, snippets)`
end