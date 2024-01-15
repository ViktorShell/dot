local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  { 
    "arnamak/stay-centered.nvim",
    lazy = false,
    config = function()
      require("stay-centered").setup()
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require "custom.configs.peek_markdown"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  }
}

return plugins
