{ config, nixos-raspberrypi, ... }:
{
  imports = [
    nixos-raspberrypi.nixosModules.raspberry-pi-5.base
    nixos-raspberrypi.nixosModules.raspberry-pi-5.display-vc4
    ../../shared/configuration.nix
  ];

  system.nixos.tags = let
    cfg = config.boot.loader.raspberryPi;
  in [
    "raspberry-pi-${cfg.variant}"
    cfg.bootloader
    config.boot.kernelPackages.kernel.version
  ];

  networking.hostName = "mmdvm-hotspot";

  services.xserver.enable = false;

  services.openssh.enable = true;
}

