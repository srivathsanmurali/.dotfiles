return {
  {
    "folke/snacks.nvim",
    priority=1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      image = {
        enabled = true,
        img_dirs = { "img", "images", "assets", "static", "public", "media", "attachments", "_attachments"},
      }
    }
  }
}
