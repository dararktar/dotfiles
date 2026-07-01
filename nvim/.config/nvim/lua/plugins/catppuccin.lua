return {
  {
    "catppuccin/nvim",
    lazy = false,
    opts = {
      flavour = "frappe",
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
