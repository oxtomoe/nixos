{ pkgs, ... }:

{
  imports = [
    ../../modules/home
  ];

  home.username = "tomoe";
  home.homeDirectory = "/home/tomoe";
  home.stateVersion = "25.11";
}
