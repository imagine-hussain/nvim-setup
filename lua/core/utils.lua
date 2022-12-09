local utils = {}

function utils.apply_mappings(mappings)
    for mode, maps in pairs(mappings) do
        for trigger_key, config in pairs(mappings) do
            if config then
                -- Allow for both table and raw remap to be passed
                local command = config
                if type(config) == "table" then
                    command = config[1]
                    config[1] = nil
                else
                    config = {}
                end
                -- https://github.com/neovim/neovim/pull/16591
                vim.keymap.set(mode, trigger_key, command, config)
            end
        end
    end
end

return utils