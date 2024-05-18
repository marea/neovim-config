---@diagnostic disable:undefined-doc-name,inject-field
-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  transparency = true,
  theme = "onenord",
  tabufline = {
    order = { "treeOffset", "buffers", "tabs" },
  },
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

return M
