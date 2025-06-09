{ lib, config, pkgs, ... }:
with lib;
let
  # Shorter name to access final settings a 
  # user of hello.nix module HAS ACTUALLY SET.
  # cfg is a typical convention.
  cfg = config.services.mmdvm_host;
in
{

  options.services.mmdvm_host = {
    enable = mkEnableOption "MMDVMHost service";

    host_package = mkOption {
      default = (pkgs.callPackage ../overrides/mmdvm-firmware.nix {});
      type = types.package;
    };

    firmware_package = mkOption {
      default = (pkgs.callPackage ../overrides/mmdvm-host/default.nix {});
      type = types.package;
    };

    user = mkOption {
      type = types.str;
      default = "afg";
    };

    group = mkOption {
      type = types.str;
      default = "afg";
    };

    config-file = mkOption {
      type = types.path;
    };

    usb-tty = mkOption {
      type = types.str;
      default = "/dev/ttyUSB0";
    };

    dmr-id-url = mkOption {
      type = types.str;
      default = "https://database.radioid.net/static/user.csv";
    };
  };


  config = mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.stm32flash
      cfg.host_package
    ];

    systemd.tmpfiles.rules = [
      "d '/var/lib/mmdvm' 0750 ${cfg.user} ${cfg.group} - -"
    ];

    systemd.services.mmdvm_host = {
      wantedBy = [ "multi-user.target" ];
      wants = [ "network.target" ];
      after = [ "network.target" ];
      description = "MMDVMHost service";
      serviceConfig = {
        Type = "exec";
        User = cfg.user;
        Group = cfg.group;
        Restart = "always";
        RestartSec = "3s";
        RuntimeDirectory = "MMDVMHost";
      };
      script = ''
        if [ ! -e /var/lib/mmdvm/DMRIds.dat ]; then
          touch /var/lib/mmdvm/DMRIds.dat
        fi

        if [ ! -e /var/lib/mmdvm/firmware-version ]; then
          touch /var/lib/mmdvm/firmware-version
        fi
        if [ "${cfg.firmware_package}" != "$(cat /var/lib/mmdvm/firmware-version)" ]; then
          ${pkgs.stm32flash}/bin/stm32flash -w ${cfg.firmware_package}/firmware/mmdvm_f4.bin -i ',-dtr,-rts,dtr,,:-dtr,rts,dtr' ${cfg.usb-tty}
          echo "${cfg.firmware_package}" > /var/lib/mmdvm/firmware-version
        fi

        exec ${cfg.host_package}/bin/MMDVMHost ${cfg.config-file}
      '';
    };

    systemd.paths.mmdvm_dmr_ids = {
      after = [ "mmdvm_host.service" ];
      wantedBy = [ "multi-user.target" ];
      pathConfig = {
        PathModified = "/var/lib/mmdvm/DMRIds.dat";
        Unit = "mmdvm_host_restart.service";
      };
    };

    systemd.services.dmr_id_update = {
      wants = [ "network.target" ];
      after = [ "network.target" ];
      description = "Update DMR ids";
      startAt = "02:00:00";
      serviceConfig = {
        Type = "oneshot";
        User = cfg.user;
        Group = cfg.group;
      };

      script = ''
        ${pkgs.curl}/bin/curl "${cfg.dmr-id-url}" | \
          ${pkgs.gnused}/bin/sed -e 's/\t//g' | ${pkgs.gawk}/bin/awk -F"," '/,/{gsub(/ /, "", $2); printf "%s\t%s\t%s\n", $1, $2, $3}' | \
          ${pkgs.gnused}/bin/sed -e 's/\(.\) .*/\1/g' > /var/lib/mmdvm/DMRIds.tmp

        NUMOFLINES=$(${pkgs.coreutils}/bin/wc -l /var/lib/mmdvm/DMRIds.tmp | ${pkgs.gawk}/bin/awk '{print $1}')
        if [ $NUMOFLINES -gt 1 ]
        then
           mv /var/lib/mmdvm//DMRIds.tmp /var/lib/mmdvm/DMRIds.dat
        else
           rm /var/lib/mmdvm//DMRIds.tmp 
        fi
      '';
    };

  };

}

