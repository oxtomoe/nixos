{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # XDG Portals — нужны для диалогов файлов, скриншотов и тем в приложениях (Telegram, Discord и др.)
  xdg.portal = {
    enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk 
      pkgs.xdg-desktop-portal-hyprland
    ];
    config = {
      common = {
        default = [ "hyprland" ];
        "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
      };
    };
    xdgOpenUsePortal = true;
  };
}
