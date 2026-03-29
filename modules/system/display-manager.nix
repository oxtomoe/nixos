{ pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "rose-pine";
  };

  environment.systemPackages = [
    (pkgs.callPackage ./sddm-theme.nix { })
  ];
}
