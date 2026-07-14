let
  primary = "age1yubikey1qtzf8n8zwhzj7mprlswv4c08q7snma055kwjvg2m35x062dvsc6pq7e55yk";
  yubikeys = [ primary ];

  dan = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILnjvflqEEYV3112bAqMnbXoHDrbPjNXnNveW2a8cdNf dan@dan-nixos-thinkpad-x280";
  users = [ dan ];

  thinkpad-x280 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJFyVg8v0vKmCXAH/j/aqO/EPYECjHd+ypE7+QMl2gdz root@thinkpad-x280";
  ai-7600k-gtx1080 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAzqLAr3FGPdk0qnOjfB2/T5H8vYc/hRIodb5l/sND8X root@ai-7600k-gtx1080";
  mmdvm-hotspot = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFrAK+P3u+P3kZ+OmDqTx+mqlQ7ieOFDxYC9bG+Rzg8H root@mmdvm-hotspot";

  systems = [ thinkpad-x280 ai-7600k-gtx1080 mmdvm-hotspot ];

in
{
  "mmdvm-config.age".publicKeys = yubikeys ++ users ++ systems;
  "wpa-supplicant.age".publicKeys = yubikeys ++ users ++ [ thinkpad-x280 ai-7600k-gtx1080 ];
}
