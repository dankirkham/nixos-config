let
  main = "age1yubikey1qfxtwh9rmp8qm0er3hgdwe06jlxexknehag7lrjmv6zx45y80yd3xj20mg0";
  yubikeys = [ main ];

  dan = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILnjvflqEEYV3112bAqMnbXoHDrbPjNXnNveW2a8cdNf dan@dan-nixos-thinkpad-x280";
  users = [ dan ];

  thinkpad-x280 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJFyVg8v0vKmCXAH/j/aqO/EPYECjHd+ypE7+QMl2gdz root@thinkpad-x280";
  ai-7600k-gtx1080 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAzqLAr3FGPdk0qnOjfB2/T5H8vYc/hRIodb5l/sND8X root@ai-7600k-gtx1080";
  mmdvm-hotspot = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFrAK+P3u+P3kZ+OmDqTx+mqlQ7ieOFDxYC9bG+Rzg8H root@mmdvm-hotspot";

  systems = [ thinkpad-x280 ai-7600k-gtx1080 mmdvm-hotspot ];

in
{
  "mmdvm-config.age".publicKeys = yubikeys ++ users ++ systems;
}
