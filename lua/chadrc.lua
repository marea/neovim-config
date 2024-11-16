---@diagnostic disable:undefined-doc-name,inject-field
-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  transparency = true,
  theme = "ayu_dark",
  hl_override = {
    NVimTreeNormal = { bg = "none" },
    NvimTreeNormalNC = { bg = "none" },
    St_LspStatus = { bg = "none" },
    St_LspStatus_Icon = { bg = "none" },
    St_cwd_sep = { bg = "none" },
    St_file_sep = { bg = "none" },
    St_gitIcons = { bg = "none" },
    St_lspError = { bg = "none" },
    TblineFill = { bg = "none" },
    Tb = { bg = "none" },
  },
}

M.ui = {
  tabufline = {
    order = { "treeOffset", "buffers", "tabs" },
  },
  statusline = {
    theme = "vscode",
  },
}

return M
