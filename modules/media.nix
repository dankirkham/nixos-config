{ pkgs, config, ... }:
{
  config = {
    home.packages = with pkgs; [
      ncspot
    ];
  };
}
