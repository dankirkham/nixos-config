{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../shared/configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Pick only one of the below networking options.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.hostName = "thinkpad-x280"; # Define your hostname.

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

  services.xserver.enable = true;
  # services.xserver.windowManager.xmonad = {
  #   enable = true;
  #   enableContribAndExtras = true;
  # };
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "caps:escape";

  services.openssh.enable = true;

  # for intel graphics
  hardware.graphics.enable = true;
  # 32-bit for wine
  hardware.graphics.enable32Bit = true;
  services.xserver.videoDrivers = [ "modesetting" ];

  services.libinput.touchpad.naturalScrolling = true;

  # needed for yubikey OTP
  services.pcscd.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    package = pkgs.callPackage ../../overrides/bluez.nix {};
  };

  services.udev.extraRules = ''
    # allow "plugdev" group read/write access to ADI PlutoSDR devices
    # DFU Device
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0456", ATTRS{idProduct}=="b674", MODE="0664", GROUP="plugdev"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="2fa2", ATTRS{idProduct}=="5a32", MODE="0664", GROUP="plugdev"
    # SDR Device
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0456", ATTRS{idProduct}=="b673", MODE="0664", GROUP="plugdev"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="2fa2", ATTRS{idProduct}=="5a02", MODE="0664", GROUP="plugdev"
    # tell the ModemManager (part of the NetworkManager suite) that the device is not a modem, 
    # and don't send AT commands to it
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0456", ATTRS{idProduct}=="b673", ENV{ID_MM_DEVICE_IGNORE}="1"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="2fa2", ATTRS{idProduct}=="5a02", ENV{ID_MM_DEVICE_IGNORE}="1"
  '';
}

