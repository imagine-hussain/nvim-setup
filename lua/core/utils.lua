function utils.apply_mappings(mappings)
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
