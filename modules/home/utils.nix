{ pkgs, ... }:

{
  home.packages = with pkgs; [
    waybar
    grimblast     
    wl-clipboard 
    cliphist    
  ];
}
