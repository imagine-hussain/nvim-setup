function utils.apply_mappings(mappings)
    utils.print_err("called in map")
    for mode, maps in pairs(mappings) do
        for trigger_key, config in pairs(maps) do
            if config then
                -- Allow for both table and raw remap to be passed
                local command = config
                if type(config) == "table" then
                    command = config[1]
                    config[1] = nil
                else
                    config = {}
                end
                if command == nil then
                    command = "nil"
                end
                -- https://github.com/neovim/neovim/pull/16591
                vim.keymap.set(mode, trigger_key, command, config)
            end
        end
    end
end

function utils.apply_settings(settings)
    utils.print_err("setting UTILS:")
    for scope, scoped_option_table in pairs(settings) do
        for setting, value in pairs(scoped_option_table) do
            vim[scope][setting] = value
        end
    end
end

function utils.load_fail_error(file, err)
  vim.api.nvim_err_writeln(
    "Failed to load " .. file .. "\n\n" .. "Error Message: " .. err
  )
end

function utils.print_err(err)
    vim.api.nvim_err_writeln(err)
end

function utils.plugin_exists(plugin)
    -- `packer_plugins` will be global defined by packer
    return packer_plugins ~= nil and packer_plugins[plugin] ~= nil
end
