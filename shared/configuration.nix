{ agenix, pkgs, ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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

