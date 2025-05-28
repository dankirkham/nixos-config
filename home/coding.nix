{ config, pkgs, ... }:
{
  config = {
    home.packages = with pkgs; [
      # tools
      alacritty
      delta
      neovim
      tmux
      zellij

      # langs
      nodejs_24
      rustup

      # language tools
      cargo-expand
      cargo-info
      bacon
      gcc
      cmake
    ];
  };
}
