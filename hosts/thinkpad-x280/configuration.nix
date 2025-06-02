{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../shared/configuration.nix
  ];

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
  services.libinput.touchpad.naturalScrolling = true;

  # needed for yubikey OTP
  services.pcscd.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    package = pkgs.callPackage ../../overrides/bluez.nix {};
  };
}

