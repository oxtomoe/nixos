{ pkgs, ... }:

let
  colors = (import ../../themes/rose-pine.nix).theme;
  fonts = import ../../themes/fonts.nix;

  # хелпер — убирает # из hex
  hex = c: builtins.replaceStrings [ "#" ] [ "" ] c;
in
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;

    font = "${fonts.sans} ${toString fonts.size.normal}";
    terminal = "kitty";

    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      icon-theme = "Papirus-Dark";
      display-drun = "Apps";
      display-run = "Run";
      display-window = "Windows";
      drun-display-format = "{name}";
      disable-history = false;
      sidebar-mode = false;
    };

    theme =
      let
        mkLiteral = v: {
          _type = "literal";
          value = v;
        };
      in
      {
        "*" = {
          bg = mkLiteral "#${hex colors.base}";
          bg-alt = mkLiteral "#${hex colors.surface}";
          fg = mkLiteral "#${hex colors.text}";
          fg-alt = mkLiteral "#${hex colors.subtle}";
          accent = mkLiteral "#${hex colors.iris}";
          urgent = mkLiteral "#${hex colors.love}";
          selected = mkLiteral "#${hex colors.highlightMed}";

          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@fg";
          margin = 0;
          padding = 0;
          spacing = 0;
        };

        "window" = {
          background-color = mkLiteral "@bg";
          border = mkLiteral "1px";
          border-color = mkLiteral "@accent";
          border-radius = mkLiteral "8px";
          width = mkLiteral "480px";
          padding = mkLiteral "12px";
        };

        "inputbar" = {
          background-color = mkLiteral "#${hex colors.surface}";
          border-radius = mkLiteral "8px";
          padding = mkLiteral "8px 12px";
          margin = mkLiteral "0 0 8px 0";
          children = mkLiteral "[prompt, entry]";
        };

        "prompt" = {
          text-color = mkLiteral "@accent";
          margin = mkLiteral "0 8px 0 0";
        };

        "entry" = {
          text-color = mkLiteral "@fg";
          placeholder = "Search...";
          placeholder-color = mkLiteral "@fg-alt";
        };

        "listview" = {
          lines = 8;
          columns = 1;
          spacing = mkLiteral "4px";
        };

        "element" = {
          padding = mkLiteral "8px 12px";
          border-radius = mkLiteral "8px";
        };

        "element normal.normal" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@fg";
        };

        "element selected.normal" = {
          background-color = mkLiteral "@selected";
          text-color = mkLiteral "@fg";
        };

        "element-text" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
        };

        "element-icon" = {
          background-color = mkLiteral "transparent";
          size = mkLiteral "20px";
          margin = mkLiteral "0 8px 0 0";
        };
      };
  };
}
