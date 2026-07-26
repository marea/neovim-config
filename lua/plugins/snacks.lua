local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'folke/snacks.nvim' }

local snacks = require("snacks")

snacks.setup({
  dashboard = {
    enabled = true,
    preset = {
      header = [[
▀▓▄▄░▄▓█▄▄   ▄▄▄  ▄██▄    ▀░▄▄      ▄▄█▄▄   ▄██▄   
 ▓▓█▀ ▀▓▓█▀ ▀▓▓▌ ▀  ▀█▌    ▓▓▌▄▄   ▓█▀ ▀▓▓ ▀  ▀█▌  
▐▒▒   ▐▒▒   ▐▒▒   ▄▄█▓█   ▐▒▒▀▄▓█ ▐▒▌  ▄▒▀  ▄▄█▓█  
░░▌   ░░▌   ░░▌  ██▀ ▀▓▌  ░░▌ ▀░▀  ▀░░▀    ██▀ ▀▓▌ 
█░   ▀██   ▀██   ▓█▄▄▒▒  ▀██        ▀█▄  ▄ ▓█▄▄▒▒  
  ▀     ▀     ▀   ▀▀▀▀      ▀          ▀▀   ▀▀▀▀   ]]
    },
    sections = {
      {
        pane = 1,
        { section="header", padding = 0 },
        { section="keys", gap = 0, padding = 1 },
      },
      {
        pane = 2,
        {
          section = "terminal",
          cmd = "chafa ~/.images/nvim-dash.jpg --format symbols --symbols sextant --size 45x35 --stretch",
          width = 45,
          height = 35,
          padding = 1
        }
      }
    }
  },
  image = {
    enabled = true
  },
  terminal = {
    enabled = true,
    keys = {
      term_normal = {
        "<esc>",
        function(self)
          self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
          if self.esc_timer:is_active() then
            self.esc_timer:stop()
            vim.cmd("stopinsert")
          else
            self.esc_timer:start(200, 0, function() end)
            return "<esc>"
          end
        end,
        mode = "t",
        expr = true,
        desc = "Double escape to normal mode",
      },
    }
  }
})

vim.keymap.set('n', '<C-/>', function() Snacks.terminal() end)
vim.keymap.set('t', 'jk', '<C-\\><C-n>')

-- vim: ts=2 sts=2 sw=2 et
