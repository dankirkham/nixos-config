{
  fetchgit,
  stdenv,
  python2,
}:

stdenv.mkDerivation rec {
  pname = "ltr-gui";
  version = "2024-03-26";

  src = fetchgit {
    url = "https://github.com/uglyDwarf/linuxtrack";
    rev = "205f8d65107059061645f9c1a3c7a2c5828383d5";
    hash = "sha256-HbwDaWFFLX56hwGq6cNbq96lyHJjmL9EMZ1bP3pAuJs=";
  };

  buildInputs = [ python2 ];

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src/python_prototype/linux_tir4_prototype.py $out/bin/ltr-gui
    chmod +x $out/bin/ltr-gui
    patchShebangs $out/bin/ltr-gui
  '';
}
