{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../shared/configuration.nix
    ./nvidia.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Pick only one of the below networking options.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.hostName = "ai-7600k-gtx1080";

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

  services.xserver.enable = false;

  services.openssh.enable = true;

  # cross compile tools for rpi
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
}

