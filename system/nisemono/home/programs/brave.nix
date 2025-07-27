{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    package = pkgs.brave;

    extensions = [
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      "kpmjjdhbcfebfjgdnpjagcndoelnidfj" # Control Panel for Twitter
      "cofdbpoegempjloogbagkncekinflcnj" # DeepL Translator
      "agnaejlkbiiggajjmnpmeheigkflbnoo" # Discord Rich Presence
      "ponfpcnoihfmfllpaingbgckeeldkhle" # Enhancer for YouTube
      "edibdbjcniadpccecjdfdjjppcpchdlm" # I still don't care about cookies
      "fkagelmloambgokoeokbpihmgpkbgbfm" # Indie Wiki Buddy
      "kekjfbackdeiabghhcdklcdoekaanoel" # MAL-Sync
      "nbcjlcokgigjfhejofmbaomcimggiafn" # movie-web remastered extension
      "nbdpnlpphdfoodlknhfphenniclnjcgl" # nothx
      "agjnjboanicjcpenljmaaigopkgdnihi" # PreMiD
      "hlepfoohegkhhmjieoechaddaejaokhf" # Refined GitHub
      "mmioliijnhnoblpgimnlajmefafdfilb" # Shazam: Find song names from your browser
      "ijcpiojgefnkmcadacmacogglhjdjphj" # Shinigami Eyes
      "mafpmfcccpbjnhfhjnllmmalhifmlcie" # Snowflake
      "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock for YouTube - Skip Sponsorships
      "clngdbkpkpeebahjckkjfobafhncgmne" # Stylus
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      "cbghhgpcnddeihccjmnadmkaejncjndb" # Vencord Web
    ];
    commandLineArgs = [
      "--hide-crash-restore-bubble"
    ];
  };
}
