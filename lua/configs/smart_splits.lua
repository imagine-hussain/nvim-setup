local status_ok, smart_splits = pcall(require, "smart-splits")

if status_ok then
    smart_splits.setup {
        ignored_filetypes = {
            "help",
            "nofile",
            "terminal",
            "prompt",
        },
        ignored_buftypes = { "nofile" },
    }
end
