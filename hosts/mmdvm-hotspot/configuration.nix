{ ... }:
{
  imports = [
    ../../shared/configuration.nix
  ];

  raspberry-pi-nix.board = "bcm2712";

  networking.hostName = "mmdvm-hotspot";

  services.xserver.enable = false;

  services.openssh.enable = true;
}

