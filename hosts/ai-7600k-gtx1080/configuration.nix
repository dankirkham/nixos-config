{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../shared/configuration.nix
    ../../shared/home-wifi.nix
    ./nvidia.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

