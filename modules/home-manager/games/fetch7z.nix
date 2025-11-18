{
  stdenv,
  fetchurl,
  p7zip,
}:

{ pname,
  version,
  urls,
  hash,
}:
  stdenv.mkDerivation {
    inherit pname version;

    src = fetchurl {
      inherit urls hash;
    };

    unpackPhase = ''
      7z x $src
    '';

    nativeBuildInputs = [ p7zip ];

    installPhase = ''
      mkdir -p $out
      cp -r * $out
    '';
  }
