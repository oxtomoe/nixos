{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    binutils
    ripgrep
    fd
    git
    cmake
    libtool
    emacs-lsp-booster
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
  };

  services.emacs = {
    enable = true;
    client.enable = true;
  };

  xdg.configFile."doom" = {
    source = ./doom;
    recursive = true;
  };
}
