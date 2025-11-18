{
  fetchzip,
  mkDosGame,
}:
(mkDosGame {
    name = "Battlehawks 1942";
    src = fetchzip {
      urls = [ "https://archive.org/download/battle-hawks-1942/BattleHawks1942.zip" ];
      hash = "sha256-izAmbBMPqqQSTc3evI699Ja7JHNSfowGR782BKCp1uM=";
      stripRoot = false;
    };
    cmd = "battlehawks1942";
    year = "1988";
    description = "Naval air combat combat flight simulation game released in 1988 by Lucasfilm Games.";
    exe = "BH.EXE";
})
