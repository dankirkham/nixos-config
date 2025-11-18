{
  fetch7z,
  mkDosGame,
}:
(mkDosGame rec {
    name = "Secret Weapons of the Luftwaffe";
    year = "1991";
    src = fetch7z {
      urls = [ "https://archive.org/download/secret-weapons-of-the-luftwaffe-mr-abandonware/Secret%20Weapons%20of%20the%20Luftwaffe%20-%20Source.7z" ];
      hash = "sha256-fFFQZOh0GTpsOpxl7PfYJnxvaElJM6SJgLzbT2oE814=";
      pname = "${name}-src";
      version = year;
    };
    cmd = "swotl";
    description = "World War II air-combat combat flight simulation game";
    exe = "SWOTL.EXE";
    dir = "SWOTL";
})
