{
  dosbox,
  stdenv,
  writeShellApplication,
}:
{
  name,
  src,
  cmd,
  year,
  description ? "DOS game",
  exe,
  dir ? ".",
}:
let
  script = writeShellApplication {
    name = cmd;
    text = ''
      cd ${src}/${dir}
      stat ${exe}
      ${dosbox}/bin/dosbox ${exe}
    '';
  };
in
stdenv.mkDerivation {
  pname = cmd;
  version = year;
  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    cp -r ${script}/bin/* $out/bin/

    mkdir -p $out/share/applications
    cat > $out/share/applications/${cmd}.desktop <<EOF
    [Desktop Entry]
    Name=${name}
    Comment=${description}
    Exec=${script}/bin/${cmd}
    Terminal=false
    Type=Application
    Categories=Game;
    EOF
  '';
}
