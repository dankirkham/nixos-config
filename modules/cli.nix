{ config, pkgs, ... }:
{
  config = {
    home.packages = with pkgs; [
      bat
      btop
      curl
      dnsutils
      eza
      fd
      fzf
      htop
      jq
      killall
      pciutils
      ripgrep
      tree
      usbutils
      uutils-coreutils
      wget
      xxd
    ];
  };
}
