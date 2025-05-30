return {
  {
    "neovim/nvim-lspconfig",
    -- event = "LazyFile",
    opts = {
      diagnostics = {
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
      },
      servers = {
        ruff = {},
        rust_analyzer = {},
        lua_ls = {},
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


      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
    end,
  },
}
