{ stdenvNoCC, fetchFromGitHub, qt5 }:

stdenvNoCC.mkDerivation rec {
  pname = "sddm-rose-pine-theme";
  version = "1.2";
  dontBuild = true;

  propagatedUserEnvPkgs = [ qt5.qtgraphicaleffects ];

  src = fetchFromGitHub {
    owner = "lwndhrst";
    repo = "sddm-rose-pine";
    rev = "v${version}";
    sha256 = "sha256-+WOdazvkzpOKcoayk36VLq/6lLOHDWkDykDsy8p87JE=";
  };

  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -aR $src $out/share/sddm/themes/rose-pine
  '';
}
