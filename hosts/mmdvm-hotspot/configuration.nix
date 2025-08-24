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

  networking.hostName = "mmdvm-hotspot";

  services.avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        addresses = true;
        domain = true;
        workstation = true;
      };
  };

  boot.loader.systemd-boot.enable = false;

  system.nixos.tags = let
    cfg = config.boot.loader.raspberryPi;
  in [
    "raspberry-pi-${cfg.variant}"
    cfg.bootloader
    config.boot.kernelPackages.kernel.version
  ];

  # boot.loader.raspberryPi.extraDeviceTreeOverlays = (pkgs.callPackage ../../overrides/uart0-ctsrts/default.nix {});

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
    # uart0-ctsrts = {
    #   enable = true;
    #   params = {};
    # };
  };

  services.xserver.enable = false;
  services.openssh.enable = true;

  age.secrets.mmdvm-config = {
    file = ../../secrets/mmdvm-config.age;
    owner = "dan";
    group = "users";
  };
  services.mmdvm_host = {
    enable = true;
    user = "dan";
    group = "users";
    config-file = config.age.secrets.mmdvm-config.path;
    usb-tty = "/dev/ttyAMA0";
  };

  environment.systemPackages = [
      (pkgs.callPackage ../../overrides/mmdvm-firmware.nix {})
      (pkgs.callPackage ../../overrides/mmdvm-host/default.nix {})
      pkgs.stm32flash
      (pkgs.callPackage ../../overrides/uart0-ctsrts/default.nix {})
      pkgs.wiringpi
  ];
}

