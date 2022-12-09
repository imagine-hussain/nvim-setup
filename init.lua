_G.utils = {}
local utils_ok, _ = pcall(require, "core.utils")
if not utils_ok then
  vim.api.nvim_err_writeln("Failed to load core.utils")
  return
end


local function main()
  for _, source_file in ipairs {
    "core.plugins",
    "core.settings",
    "core.mappings",
    "core.colours",
  } do
    local status_ok, err = pcall(require, source_file)
    if not status_ok then
      utils.load_fail_error(source_file, err)
    end
  end
end

main()
