let
  dan = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILnjvflqEEYV3112bAqMnbXoHDrbPjNXnNveW2a8cdNf dan@dan-nixos-thinkpad-x280";

  thinkpad-x280 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJFyVg8v0vKmCXAH/j/aqO/EPYECjHd+ypE7+QMl2gdz root@thinkpad-x280";
  systems = [ thinkpad-x280 ];

in
{
  "email.age".publicKeys = dan ++ systems;
}
