local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

-- Actual lsp configs done elsewhere
if status_ok then
    lsp_installer.setup {
        ui = {
            icons = {
                server_installed = "✓",
                server_uninstalled = "✗",
                server_pending = "⟳",
            }
        }
    }
end
