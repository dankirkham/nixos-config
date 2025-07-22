{
  bison,
  fetchgit,
  libgcc,
  libusb1,
  minixml,
  pkg-config,
  multiStdenv,
  zlib,
  v4l-utils,
  libsForQt5,
  libGL,
  glew,
}:

multiStdenv.mkDerivation (finalAttrs: {
  pname = "linuxtrack";
  version = "2024-03-26";

  src = fetchgit {
    url = "https://github.com/uglyDwarf/linuxtrack";
    rev = "205f8d65107059061645f9c1a3c7a2c5828383d5";
    hash = "sha256-HbwDaWFFLX56hwGq6cNbq96lyHJjmL9EMZ1bP3pAuJs=";
  };

  buildInputs = [
    bison
    libgcc
    libusb1
    minixml
    pkg-config
    zlib
    v4l-utils
    libsForQt5.qt5.wrapQtAppsHook
    libsForQt5.qt5.full
    libGL
    glew
  ];

  patches = [
    ./01-missing-include.patch
  ];

  hardeningDisable = [ "all" ];

  # dontWrapQtApps = true;
})

