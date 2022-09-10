local status_ok, ts_context_commentstring = pcall(require, "nvim-treesitter.configs")

if status_ok then
    ts_context_commentstring.setup {
        enable = true,
        -- config = {
            -- key = language: { __default = "", multiline = "" }
        -- }
    }
end
