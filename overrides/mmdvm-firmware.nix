{ stdenv, fetchFromGitHub, gcc-arm-embedded, ... }:

stdenv.mkDerivation {
  pname = "mmdvm-firmware";
  version = "yolo";

  src = fetchFromGitHub {
    owner = "g4klx";
    repo = "MMDVM";
    rev = "c3246dbcb771c0f9ead3bbe40e78fba1bfe5debc";
    sha256 = "sha256-UKhdSYvOZQNgOCjEOv+Q7cLB/+PrFQl8kKVkQOKrK5M=";
    fetchSubmodules = true;
  };

  buildInputs = [ gcc-arm-embedded ];

  buildPhase = ''
    cat Makefile
    make f4m
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/firmware
    cp -v bin/* $out/firmware/

    runHook postInstall
  '';
}
