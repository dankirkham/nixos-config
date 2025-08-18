{ agenix, pkgs, ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Pick only one of the below networking options.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  time.timeZone = "America/Chicago";

  users.users.dan = {
    isNormalUser = true;
    extraGroups = [ "wheel" "dialout" ];
    packages = with pkgs; [
    ];
    shell = pkgs.bash;
    home = "/home/dan";
  };

  environment.variables.EDITOR = "nvim";
  environment.systemPackages = with pkgs; [
    agenix.packages.${pkgs.system}.default
    age-plugin-yubikey
    vim
  ];

  # Don't change this to update packages!
  system.stateVersion = "24.11";
}

