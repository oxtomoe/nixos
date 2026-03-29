{ pkgs, ... }:
let
  fonts = import ../../themes/fonts.nix;
in
{
  gtk = {
    enable = true;
    theme = {
      name = "rose-pine-moon-gtk";
      package = pkgs.rose-pine-gtk-theme;
    };
    gtk4.theme = null;
    iconTheme = {
      name = "rose-pine";
      package = pkgs.rose-pine-icon-theme;
    };
    font = {
      name = fonts.sans;
      size = fonts.size.normal;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };
}
