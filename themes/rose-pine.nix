# themes/rose-pine.nix
# Rosé Pine — official palette from rosepinetheme.com/palette/ingredients
# 3 variants: main, moon, dawn
# To switch variant — change `active` at the bottom of this file.

let
  # ========================
  # Rosé Pine (Main) — dark
  # ========================
  main = {
    base = "#191724"; # Background
    surface = "#1f1d2e"; # Slightly lighter background
    overlay = "#26233a"; # Popup/dialog background
    muted = "#6e6a86"; # Comments, disabled
    subtle = "#908caa"; # Borders, line numbers
    text = "#e0def4"; # Default foreground
    love = "#eb6f92"; # Errors, git deleted
    gold = "#f6c177"; # Warnings, search
    rose = "#ebbcba"; # Git modified
    pine = "#31748f"; # Hints, links
    foam = "#9ccfd8"; # Regex, escape chars
    iris = "#c4a7e7"; # Tags, accents
    highlightLow = "#21202e"; # Subtle backgrounds
    highlightMed = "#403d52"; # Selection background
    highlightHigh = "#524f67"; # Active line background
  };

  # ========================
  # Rosé Pine Moon — dark, slightly bluer
  # ========================
  moon = {
    base = "#232136";
    surface = "#2a273f";
    overlay = "#393552";
    muted = "#6e6a86";
    subtle = "#908caa";
    text = "#e0def4";
    love = "#eb6f92";
    gold = "#f6c177";
    rose = "#ea9a97";
    pine = "#3e8fb0";
    foam = "#9ccfd8";
    iris = "#c4a7e7";
    highlightLow = "#2a283e";
    highlightMed = "#44415a";
    highlightHigh = "#56526e";
  };

  # ========================
  # Rosé Pine Dawn — light variant
  # ========================
  dawn = {
    base = "#faf4ed";
    surface = "#fffaf3";
    overlay = "#f2e9e1";
    muted = "#9893a5";
    subtle = "#797593";
    text = "#575279";
    love = "#b4637a";
    gold = "#ea9d34";
    rose = "#d7827e";
    pine = "#286983";
    foam = "#56949f";
    iris = "#907aa9";
    highlightLow = "#f4ede8";
    highlightMed = "#dfdad9";
    highlightHigh = "#cecacd";
  };

in
{
  # ========================
  # GLOBAL SWITCHER
  # Change this to: main | moon | dawn
  # ========================
  theme = moon;

  # Expose variants for reference if needed
  variants = { inherit main moon dawn; };
}
