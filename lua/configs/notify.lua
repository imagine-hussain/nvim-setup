local status_ok, notify = pcall(require, "notify")

if status_ok then
    notify.setup {
        stages = "fade_in_slide_out",
    }
    vim.notify = notify
end
