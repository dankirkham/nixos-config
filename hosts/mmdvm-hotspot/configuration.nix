{ config, nixos-raspberrypi, ... }:
{
  imports = [
    nixos-raspberrypi.nixosModules.raspberry-pi-4.base
    nixos-raspberrypi.nixosModules.usb-gadget-ethernet
    ../../shared/configuration.nix
    ./hardware-configuration.nix
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

