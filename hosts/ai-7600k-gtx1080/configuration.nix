{ config, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../shared/configuration.nix
    # ./nvidia.nix
  ];

  networking.hostName = "ai-7600k-gtx1080";

  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  services.openssh.enable = true;

  # cross compile tools for rpi
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  programs.steam.enable = true;
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-unwrapped"
  ];
}
