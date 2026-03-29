{ pkgs, ... }:

let
  colors = (import ../../themes/rose-pine.nix).theme;
  fonts = import ../../themes/fonts.nix;
in
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 300;
        height = "300";
        offset = "30x30";
        origin = "top-right";
        transparency = 10;
        frame_color = "${colors.iris}";
        font = "${fonts.sans} 10";
        corner_radius = 8;
        padding = 8;
        horizontal_padding = 8;
        frame_width = 1;

        # Иконки
        icon_theme = "rose-pine";
        enable_recursive_icon_lookup = true;
        max_icon_size = 64;
      };

      urgency_low = {
        background = "${colors.base}";
        foreground = "${colors.text}";
      };

      urgency_normal = {
        background = "${colors.surface}";
        foreground = "${colors.text}";
      };

      urgency_critical = {
        background = "${colors.base}";
        foreground = "${colors.love}";
        frame_color = "${colors.love}";
      };
    };
  };
}
