{ ... }:
{
  imports = [
    ../../shared/configuration.nix
  ];

  networking.hostName = "mmdvm-hotspot";

  services.xserver.enable = false;

  services.openssh.enable = true;
}

