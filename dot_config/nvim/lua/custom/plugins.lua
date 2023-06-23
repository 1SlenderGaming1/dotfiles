-- Core, Python, Rust, Lua, Bash

local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "black",
        "debugpy",
        "lua-language-server",
        "mypy",
        "ruff",
        "shellcheck",
        "pyright",
        "rust-analyzer",
      }
    }
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function ()
      require "custom.configs.telescope"
    end
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function ()
      local M = require("plugins.configs.cmp")
      table.insert(M.sources, {name='crates'})
      return M
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  -- Rust 
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
        dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end,
  },
  {
    "saecki/crates.nvim",
    ft = {"rust","toml"},
    dependencies = "hrsh7th/nvim-cmp",
    config = function(opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end,
  }
}

return plugins
