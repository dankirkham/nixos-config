{ pkgs, ... }:
{
  config = {
    home.packages = with pkgs; [
      ncspot
    ];
  };
}
