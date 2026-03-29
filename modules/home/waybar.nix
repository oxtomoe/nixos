{ pkgs, ... }:

let
  colors = (import ../../themes/rose-pine.nix).theme;
  fonts  = import ../../themes/fonts.nix;
in {
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "${fonts.sans}";
        font-size: ${toString fonts.size.small}px;
        min-height: 0;
      }

      window#waybar {
        background-color: ${colors.base};
        color: ${colors.text};
        border-bottom: 1px solid ${colors.highlightLow};
      }

      #workspaces button {
        padding: 0 10px;
        color: ${colors.subtle};
        background: transparent;
      }

      #workspaces button.active {
        color: ${colors.iris};
      }

      #workspaces button.urgent {
        color: ${colors.love};
      }

      #clock, #battery, #pulseaudio, #language, #tray {
        padding: 0 12px;
      }

      #clock {
        color: ${colors.foam};
        font-weight: bold;
      }

      #battery {
        color: ${colors.gold};
      }

      #battery.critical {
        color: ${colors.love};
      }

      #pulseaudio {
        color: ${colors.iris};
      }

      #language {
        color: ${colors.pine};
      }
    '';

    settings = [{
      layer = "top";
      position = "top";
      height = 32;

      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "pulseaudio" "hyprland/language" "battery" "tray" ];

      "hyprland/workspaces" = {
        format = "{name}";
        on-click = "activate";
      };

      "clock" = {
        format = "{:%H:%M}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };

      "battery" = {
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity}%";
        format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
      };

      "pulseaudio" = {
        format = "{icon} {volume}%";
        format-muted = "󰝟 ";
        format-icons = {
          default = ["󰕿 " "󰖀 " "󰕾 "];
        };
        on-click = "pavucontrol";
      };

      "hyprland/language" = {
        format = "󰌌  {}";
        format-en = "US";
        format-ru = "RU";
      };
    }];
  };
}
