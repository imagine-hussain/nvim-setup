local status_ok, lspconfig = pcall(require, "lspconfig")

if status_ok then
    require "configs.lsp.handlers"

    -- Add signs
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }
    for _, sign in ipairs(signs) do
        vim.fm.sign_define(
            sign.name,
            { texthl = sign.name, text = sign.text, numhl = "" }
        )
    end


    -- Add hover and help
    vim.lsp.handlers["testDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, { border = "rounded" }
    )
    vim.lsp.handlers["testDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, { border = "rounded" }
    )
    
    -- Collect Servers
    local installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
    local servers = {}
    for _, server in ipairs(lsp_installer.get_installed_servers()) do
        table.insert(servers, server.name)
    end
    -- Run server settings
    -- vim.api.nvim_err_writeln("Working")
    lspconfig["pyright"].setup ({})
end
