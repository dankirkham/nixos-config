{ pkgs, ... }:
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
      fastfetch
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
