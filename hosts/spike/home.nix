{ pkgs, ... }:

{
  imports = [
    ../../modules/home
  ];

  home.username = "tomoe";
  home.homeDirectory = "/home/tomoe";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    HSA_OVERRIDE_GFX_VERSION = "9.0.0";
    ROC_ENABLE_PRE_VEGA = "1";
  };
}
