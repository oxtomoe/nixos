{ pkgs, ... }:

let
  wallpaper = toString ../../assets/wallpapers/wallpaper.png;
in {
  home.packages = with pkgs; [
    swww
    waypaper
  ];

  wayland.windowManager.hyprland.settings.exec-once = [
    "swww-daemon && swww img ${wallpaper}"
  ];
}
