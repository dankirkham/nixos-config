{ pkgs, config, ... }:
{
  config = {
    home.packages = with pkgs; [
      kismet
      wireshark
    ];
  };
}
