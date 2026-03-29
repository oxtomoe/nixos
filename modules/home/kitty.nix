{ pkgs, ... }:

let
  colors = (import ../../themes/rose-pine.nix).theme;
  fonts = import ../../themes/fonts.nix;
in
{
  programs.kitty = {
    enable = true;

    font = {
      name = fonts.mono;
      size = fonts.size.normal;
    };

    settings = {
      # Rose Pine Moon
      foreground = colors.text;
      background = colors.base;
      selection_foreground = colors.text;
      selection_background = colors.highlightMed;
      cursor = colors.rose;
      cursor_text_color = colors.base;
      url_color = colors.foam;

      # Borders
      active_border_color = colors.iris;
      inactive_border_color = colors.highlightMed;

      # Tabs
      active_tab_foreground = colors.base;
      active_tab_background = colors.iris;
      inactive_tab_foreground = colors.subtle;
      inactive_tab_background = colors.surface;
      tab_bar_background = colors.base;

      # Colors
      color0 = colors.overlay;
      color1 = colors.love;
      color2 = colors.pine;
      color3 = colors.gold;
      color4 = colors.foam;
      color5 = colors.iris;
      color6 = colors.rose;
      color7 = colors.text;
      color8 = colors.muted;
      color9 = colors.love;
      color10 = colors.pine;
      color11 = colors.gold;
      color12 = colors.foam;
      color13 = colors.iris;
      color14 = colors.rose;
      color15 = colors.text;

      # Window
      window_padding_width = 12;
      background_opacity = "0.95";
      confirm_os_window_close = 0;

      # Misc
      scrollback_lines = 10000;
      enable_audio_bell = false;
      tab_bar_style = "powerline";
    };
  };
}
