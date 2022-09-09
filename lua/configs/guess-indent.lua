local status_ok, guess_indent = pcall(require, "guess-indent")

-- Deprecated for vim-slueth

if status_ok then
    guess_indent.setup {
        auto_cmd = true,
        filetype_exclude = {
            "help",
            "nofile",
            "terminal",
            "prompt"
        },
    }
end

