{
  fetch7z,
  mkDosGame,
}:
(mkDosGame rec {
    name = "Their Finest Hour";
    year = "1989";
    src = fetch7z {
      urls = [ "https://archive.org/download/their-finest-hour-mr-abandonware/Their%20Finest%20Hour%20-%20Source.7z" ];
      hash = "sha256-HwBdDHCrZw/UxiEbrUP1Ov81VvjiSdkUAFRBBEsCM24=";
      pname = "${name}-src";
      version = year;
    };
    cmd = "their-finest-hour";
    description = "World War II combat flight simulation game";
    exe = "BOB.EXE";
    dir = "BOB1940";
})
