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

  # for intel graphics
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "modesetting" ];

  services.libinput.touchpad.naturalScrolling = true;

  # needed for yubikey OTP
  services.pcscd.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    package = pkgs.callPackage ../../overrides/bluez.nix {};
  };
}

