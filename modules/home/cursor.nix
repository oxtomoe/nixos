{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rose-pine-cursor
    rose-pine-hyprcursor
  ];

  home.pointerCursor = {
    package = pkgs.rose-pine-cursor;
    name = "BreezeX-RosePine-Linux";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
    hyprcursor = {
      enable = true;
      size = 24;
    };
  };
}
