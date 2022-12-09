local settings_table = {
    -- Options Settings; Equiv to `set key = value`
    opt = {
        termguicolors = true, -- Allow 24bit colors
        copyindent = true, -- Copy the previous indentation on autoindenting
        history = 500, -- Size of history stored
        ignorecase = true, -- Case insensitive searching
        number = true, -- Show numberline
        relativenumber = true, -- Show relative numberline
    },
    -- Global vars / Settings; Equiv to `let g:key = value`
    g = {
        mapleader = " ", -- Leader - global
    }
}

utils.print_err("in settings")

local function dump(o) if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
end

-- print("TABLE DUMP:" .. dump(settings_table))


utils.apply_settings(settings_table)

utils.print_err("finish settings")