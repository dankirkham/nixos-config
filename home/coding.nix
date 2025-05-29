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
      python310
      # python313
      # python313Packages.conda
      # python313Packages.pip
      # python313Packages.scipy
      # python313Packages.numpy

      # language tools
      cargo-expand
      cargo-info
      bacon
      gcc
      cmake
    ];
  };
}
