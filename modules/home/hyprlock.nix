{ pkgs, config, ... }:

let
  colors = (import ../../themes/rose-pine.nix).theme;
  fonts  = import ../../themes/fonts.nix;
in {
  # Hypridle — управляет таймаутами (сон, блокировка)
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 300; # 5 минут
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 330; # 5.5 минут
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  # Hyprlock — сам экран блокировки
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading = true;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "${../../assets/wallpapers/wallpaper.png}";
          blur_passes = 3;
          blur_size = 8;
          color = "rgb(${builtins.replaceStrings ["#"] [""] colors.base})";
        }
      ];

      input-field = [
        {
          size = "250, 60";
          outline_thickness = 2;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "rgb(${builtins.replaceStrings ["#"] [""] colors.iris})";
          inner_color = "rgb(${builtins.replaceStrings ["#"] [""] colors.surface})";
          font_color = "rgb(${builtins.replaceStrings ["#"] [""] colors.text})";
          fade_on_empty = false;
          placeholder_text = "<i>Password...</i>";
          hide_input = false;
          position = "0, -120";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        # Время
        {
          text = "$TIME";
          color = "rgb(${builtins.replaceStrings ["#"] [""] colors.text})";
          font_size = 120;
          font_family = fonts.sans;
          position = "0, 80";
          halign = "center";
          valign = "center";
        }
        # Приветствие
        {
          text = "Hi, $USER";
          color = "rgb(${builtins.replaceStrings ["#"] [""] colors.subtle})";
          font_size = 25;
          font_family = fonts.sans;
          position = "0, 0";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
