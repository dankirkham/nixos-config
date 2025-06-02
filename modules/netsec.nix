{ pkgs, ... }:
{
  config = {
    home.packages = with pkgs; [
      kismet
      wireshark
    ];
  };
}
