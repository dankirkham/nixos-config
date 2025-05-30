return {
  {
    "neovim/nvim-lspconfig",
    -- event = "LazyFile",
    opts = {
      servers = {
        ruff = {},
        rust_analyzer = {},
        luau_lsp = {},
        nixd = {},
      },
      inlay_hints = {
        enabled = true,
      },
    },
    config = function(lspconfig, opts)
      local function setup(server)
        require("lspconfig")[server].setup({})
      end

      for server, server_opts in pairs(opts.servers) do
        setup(server)
      end
    end,
  },
}
