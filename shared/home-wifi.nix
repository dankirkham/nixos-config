{ config, lib, pkgs, ... }: {
  age.secrets.wpa-supplicant = {
    file = ../secrets/wpa-supplicant.age;
    owner = "root";
    group = "root";
    mode = "0400";
  };

  networking.supplicant.WLAN = {
    configFile.path = config.age.secrets.wpa-supplicant.path;
  };

  systemd.services."supplicant-wlan@" = {
    wantedBy = lib.mkForce [ ];
  };

  systemd.services.supplicant-wlan-trigger = {
    description = "Trigger supplicant instances for existing WLAN devices";
    wantedBy = [ "multi-user.target" ];
    wants = [ "systemd-udev-settle.service" ];
    after = [ "systemd-udev-settle.service" ];
    path = with pkgs; [ systemd gnugrep coreutils ];
    serviceConfig.Type = "oneshot";
    script = ''
      for iface in /sys/class/net/*; do
        if [ "$(cat "$iface/type")" = "1" ] && udevadm info -q property -p "$iface" | grep -q '^DEVTYPE=wlan$'; then
          udevadm trigger --action=add "$iface"
        fi
      done
    '';
  };

  # networking.wireless = {
  #   enable = true;  # Enables wireless support via wpa_supplicant.
  #   networks = {
  #     "MyWifi" = {
  #       psk = "myPassword!";
  #     };
  #   };
  # };
}
