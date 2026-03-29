{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    wget
    brave
    tree
    nh
    spotify
    yazi
    btop
    discord
    telegram-desktop
    gh
    libnotify
    hypridle
  ];

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
      rocmPackages.clr
      mesa
    ];
  };

  hardware.bluetooth.enable = true;
}
