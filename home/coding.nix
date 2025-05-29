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
      python313
      python313Packages.conda
      python313Packages.pip

      # language tools
      cargo-expand
      cargo-info
      bacon
      gcc
      cmake
    ];
  };
}
