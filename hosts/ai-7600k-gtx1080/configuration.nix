{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../shared/configuration.nix
    ./nvidia.nix
  ];

  networking.hostName = "ai-7600k-gtx1080";

  services.xserver.enable = false;

  services.openssh.enable = true;

  nix.settings.trusted-substituters = ["https://ai.cachix.org"];
  nix.settings.trusted-public-keys = ["ai.cachix.org-1:N9dzRK+alWwoKXQlnn0H6aUx0lU/mspIoz8hMvGvbbc="];
}

