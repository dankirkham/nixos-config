{ config, lib, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../shared/configuration.nix
  ];

  networking.hostName = "ai-7600k-gtx1080";

  services.xserver.enable = false;

  services.openssh.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # environment.systemPackages = with pkgs; [
  #   vim
  # ];
}

