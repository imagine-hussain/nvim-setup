-- TODO: Move out of here
utils = {}

function utils.add_cmp_source(source)
    vim.api.nvim_err_writeln("inside")
    local cmp_avail, cmp = require("cmp")
    if cmp_avail then
        local config = cmp.get_config()
        -- vim.api.nvim_err_writeln("CONF")
        -- vim.api.nvim_err_writeln(config)
        table.insert(config.sources, source)
        -- vim.api.nvim_err_writeln("\n\nafter")
        -- vim.api.nvim_err_writeln(config.sources)
        cmp.setup(source)
    end
end

return utils
