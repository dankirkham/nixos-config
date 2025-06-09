{ config, nixos-raspberrypi, ... }:
{
  imports = [
    nixos-raspberrypi.nixosModules.raspberry-pi-4.base
    nixos-raspberrypi.nixosModules.usb-gadget-ethernet
    ../../shared/configuration.nix
    ./hardware-configuration.nix
    ../../modules/mmdvm-host.nix
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
  services.mmdvm_host = {
    enable = true;
    user = "dan";
    group = "dan";
    config-file = "/home/dan/.config/mmdvm/config.ini";
  };
}

