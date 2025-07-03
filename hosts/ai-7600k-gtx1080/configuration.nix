{ config, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../shared/configuration.nix
    ./nvidia.nix
  ];

  networking.hostName = "ai-7600k-gtx1080";

  services.xserver.enable = false;

  services.openssh.enable = true;

  # cross compile tools for rpi
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  programs.steam.enable = true;
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "nvidia-x11-575.51.02-6.12.30"
  ];
}
