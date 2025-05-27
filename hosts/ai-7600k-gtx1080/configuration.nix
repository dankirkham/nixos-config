{ config, lib, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../shared/configuration.nix
  ];

  networking.hostName = "ai-7600k-gtx1080";

  services.xserver.enable = false;

  services.openssh.enable = true;
}

