local M = {}

---@param repo string
---@return string
M.gh = function(repo) return 'https://github.com/' .. repo end

return M
