{
  fetchFromGitHub,
  stdenv,
  cmake,
  qt6,
  kdePackages,
}:

stdenv.mkDerivation rec {
  pname = "sane-break";
  version = "v0.9.4";

  src = fetchFromGitHub {
    owner = "AllanChain";
    repo = "sane-break";
    hash = "sha256-m4gLoGgvTZKfjCJSrY2/i59RgqmJJ+WOAAsEaAo2OsI=";
    rev = version;
  };

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

