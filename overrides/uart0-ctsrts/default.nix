{
  stdenv,
  dtc,
  bash,
}:

stdenv.mkDerivation {
  pname = "uart0-ctsrts";
  version = "yolo";
  src = ./uart0-ctsrts.dts;

  propagatedBuildInputs = [ bash ];

  phases = [ "buildPhase" ];

  buildPhase = ''
    mkdir -p $out
    ${dtc}/bin/dtc -@ -I dts -O dtb -o $out/uart0-ctsrts.dtbo $src
  '';
}
