{ config, lib, pkgs, ... }:
with lib; {
  options = {
    dan.coding = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable coding packages";
      };
    };
  };

  config = mkIf config.dan.coding.enable {
    home.packages = with pkgs; [
      # tools
      delta
      neovim
      tmux
      zellij

      # langs
      nodejs_24
      rustup
      python313
      python313Packages.pip

      # language tools
      cargo-expand
      cargo-info
      bacon
      gcc
      cmake
      ruff
      uv

      # language servers
      nixd
      lua-language-server
    ] ++ lib.optionals config.dan.gui.enable [
      wezterm
    ];

    home.file.".config/nvim" = {
      source = ../dotfiles/nvim;
      recursive = true;
    };
    home.file.".config/tmux".source = ../dotfiles/tmux;
    home.file.".config/wezterm" = lib.mkIf config.dan.gui.enable {
      source = ../dotfiles/wezterm;
    };
  };
}
