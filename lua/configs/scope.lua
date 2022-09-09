local status_ok, scope = pcall(require, "scope")

if status_ok then
    scope.setup()
end