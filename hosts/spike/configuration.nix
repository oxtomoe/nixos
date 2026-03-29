{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
    ../../modules/desktop
  ];

  services.displayManager.autoLogin = {
    enable = true;
    user = "tomoe";
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "spike";
  networking.networkmanager.enable = true;

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  time.timeZone = "Europe/Vienna";

  users.users.tomoe = {
    isNormalUser = true;
    initialPassword = "277353";
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
    ];
  };

  environment.variables = {
    HSA_OVERRIDE_GFX_VERSION = "9.0.0";
    ROC_ENABLE_PRE_VEGA = "1";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}
