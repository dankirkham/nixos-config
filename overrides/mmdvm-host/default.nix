{ stdenv, fetchFromGitHub, ... }:

stdenv.mkDerivation {
  pname = "MMDVMHost";
  version = "yolo";

  src = fetchFromGitHub {
    owner = "g4klx";
    repo = "MMDVMHost";
    rev = "b02560ccbc02bdb076b77aaef3e70655a714cd36";
    sha256 = "sha256-y9mreTIsQuKr1HlUGuSZIdry9f1yFXkbEKKzAaK79v0=";
  };

  patches = [
    ./0001-patch-install-path.patch
    ./0002-fix-missing-include.patch
    ./0003-fix-null-controller.patch
    ./0004-fix-bufferoverflow.patch
  ];

}
