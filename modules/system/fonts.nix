{ pkgs, ... }:

let
  fonts = import ../../themes/fonts.nix;
in {
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      inter
      eb-garamond
      noto-fonts-color-emoji
      nerd-fonts.jetbrains-mono
    ];

    fontconfig.defaultFonts = {
      sansSerif = [ fonts.sans ];
      serif     = [ fonts.serif ];
      monospace = [ fonts.mono ];
      emoji     = [ fonts.emoji ];
    };
  };
}
