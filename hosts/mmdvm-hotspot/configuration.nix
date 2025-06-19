{ config, nixos-raspberrypi, pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    nixos-raspberrypi.nixosModules.raspberry-pi-4.base
    ../../shared/configuration.nix
    ../../modules/mmdvm-host.nix
  ];

  users.users.dan.extraGroups = [
    "gpio"
    "i2c"
    "input"
    "plugdev"
    "spi"
    "tty"
    "video"
  ];

  system.nixos.tags = let
    cfg = config.boot.loader.raspberryPi;
  in [
    "raspberry-pi-${cfg.variant}"
    cfg.bootloader
    config.boot.kernelPackages.kernel.version
  ];

  networking.hostName = "mmdvm-hotspot";

  boot.loader.raspberryPi.bootloader = "kernelboot";
  boot.loader.systemd-boot.enable = false;

  # boot.loader.raspberryPi.firmwarePackage = pkgs.linuxAndFirmware.v6_6_31.raspberrypifw;
  # boot.kernelPackages = pkgs.linuxAndFirmware.v6_6_31.linuxPackages_rpi4;

  hardware.bluetooth.enable = false;
  hardware.raspberry-pi.config.all.base-dt-params = {
    krnbt = {
      enable = false;
    };
  };
  hardware.raspberry-pi.config.all.dt-overlays = {
    disable-bt = {
      enable = true;
      params = {};
    };
    uart0 = {
      enable = true;
      params = {};
    };
  };

  services.xserver.enable = false;
  services.openssh.enable = true;
  services.mmdvm_host = {
    # enable = true;
    user = "dan";
    group = "dan";
    config-file = "/home/dan/.config/mmdvm/config.ini";
  };

  environment.systemPackages = [
      (pkgs.callPackage ../../overrides/mmdvm-firmware.nix {})
      (pkgs.callPackage ../../overrides/mmdvm-host/default.nix {})
  ];
}

