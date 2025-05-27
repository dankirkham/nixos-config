{ config, pkgs, ... }:
{
  config = {
    home.packages = with pkgs; [
      # tools
      alacritty
      neovim
      zellij
      delta

      # langs
      nodejs_24
      rustup

      # language tools
      cargo-expand
      cargo-info
      bacon
    ];
  };
}
