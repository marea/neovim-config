return {
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        enabled = true,
        sections = {
          {
            section = "terminal",
            cmd = "chafa ~/.config/nvim/dash.jpg --format symbols --symbols all --size 80x80 --stretch; sleep .1",
            width = 80,
            height = 80,
            padding = 0,
          },
        },
      },
    },
  },
}
