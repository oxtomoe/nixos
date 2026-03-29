{ pkgs, ... }:

let
  wallpaper = toString ../../assets/wallpapers/wallpaper.png;
in
{
  home.packages = with pkgs; [
    swww
    waypaper
  ];
}
