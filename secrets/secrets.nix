let
  dan = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILnjvflqEEYV3112bAqMnbXoHDrbPjNXnNveW2a8cdNf dan@dan-nixos-thinkpad-x280";
  users = [ dan ];

  # systems = [ ];
in
{
  "identity.age".publicKeys = users;
}
