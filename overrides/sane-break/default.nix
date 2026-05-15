{
  fetchFromGitHub,
  stdenv,
  cmake,
  qt6,
  kdePackages,
}:

stdenv.mkDerivation rec {
  pname = "sane-break";
  version = "v0.10.1";

  src = fetchFromGitHub {
    owner = "AllanChain";
    repo = "sane-break";
    hash = "sha256-0Urqs4x2kxsTgGf6lfAAn5RF/y2kFiifUAm4UK8pFi8=";
    rev = version;
  };

  patches = [
    ./01-primary-display.patch
    ./02-disable-fullscreen.patch
    ./03-about-note.patch
  ];

  nativeBuildInputs = [
    cmake
    qt6.wrapQtAppsHook
  ];

  buildInputs = [
    qt6.qtbase
    qt6.qttools
    qt6.qtmultimedia
    qt6.qtwayland
    kdePackages.layer-shell-qt
  ];
}
