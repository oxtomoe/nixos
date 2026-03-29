# modules/home/hyprland.nix
{ pkgs, config, ... }:

let
  colors = (import ../../themes/rose-pine.nix).theme;
  wallpaper = ../../assets/wallpapers/wallpaper.png;
in {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {

      monitor = "HDMI-A-1,1920x1080@60,0x0,1";
      # ── Autostart ─────────────────────────────────────────────
      exec-once = [
        "hyprpaper"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

env = [
  "XCURSOR_THEME,BreezeX-RosePine-Linux"
  "XCURSOR_SIZE,24"
  "HYPRCURSOR_SIZE,24"
  "QT_QPA_PLATFORM,wayland"
  "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
  "ROC_ENABLE_PRE_VEGA,1"
  "HSA_OVERRIDE_GFX_VERSION,9.0.0"
];

      workspace = [
        "special:music, on-created-empty:uwsm app -- spotify"
        "special:comms, on-created-empty:uwsm app -- telegram-desktop"
        "special:comms, on-created-empty:uwsm app -- discord"
      ];

      # ── Variables ─────────────────────────────────────────────
      "$mod"      = "SUPER";
      "$terminal" = "kitty";
      "$browser"  = "brave";
      "$editor"   = "emacs";
      "$files"    = "kitty -e yazi";
      "$launcher" = "rofi -show drun";
      "$clip"     = "cliphist list | rofi -dmenu | cliphist decode | wl-copy";

      # ── General ───────────────────────────────────────────────
      general = {
        gaps_in  = 4;
        gaps_out = 8;
        border_size = 1;
        "col.active_border"   = "rgb(${builtins.replaceStrings ["#"] [""] colors.iris})";
        "col.inactive_border" = "rgb(${builtins.replaceStrings ["#"] [""] colors.highlightMed})";
        resize_on_border = true;
        allow_tearing    = false;
        layout           = "dwindle";
      };

      # ── Decoration ────────────────────────────────────────────
      decoration = {
        rounding         = 8;
        active_opacity   = 1.0;
        inactive_opacity = 0.95;

        blur = {
          enabled   = true;
          size      = 4;
          passes    = 2;
          vibrancy  = 0.2;
        };

        shadow = {
          enabled      = true;
          range        = 8;
          render_power = 2;
          color        = "rgba(0,0,0,0.4)";
        };
      };

      # ── Animations ────────────────────────────────────────────
      animations = {
        enabled = true;
        bezier = [ "easeOut,0.16,1,0.3,1" ];
        animation = [
          "windows,1,4,easeOut,slide"
          "fade,1,4,easeOut"
          "workspaces,1,4,easeOut,slide"
          "specialWorkspace,1,3,easeOut,slidevert"
        ];
      };

      # ── Layout ────────────────────────────────────────────────
      dwindle = {
        pseudotile     = true;
        preserve_split = true;
      };

      # ── Input ─────────────────────────────────────────────────
      input = {
        kb_layout  = "us,ru";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;
        touchpad.natural_scroll = true;
        sensitivity = 0;
      };

      gesture = [ "3, horizontal, workspace" ];

      # ── Keybinds ──────────────────────────────────────────────
      #
      #  ЛОГИКА:
      #  $mod + key          → системное (WM, фокус, воркспейс, утилиты)
      #  $mod SHIFT + key    → запуск приложения
      #  $mod CTRL + num     → перенос окна на воркспейс
      #  $mod + M / C        → тогл special workspace

      bind = [
        # -- WM --------------------------------------------------
        "$mod, Q,      killactive"
        "$mod, F,      fullscreen"
        "$mod, G,      togglefloating"
        "$mod, P,      pseudo"
        "$mod, T,      togglesplit"

        # -- Утилиты --------------------------------------------
        "$mod, Space,  exec, $launcher"
        "$mod, V,      exec, $clip"
        "$mod, Tab,    cyclenext"

        # -- Скриншоты ------------------------------------------
        ",     Print,  exec, grimblast copy area"
        "SHIFT,Print,  exec, grimblast save area ~/Pictures/Screenshots/$(date +%Y%m%d_%H%M%S).png"

        # -- Фокус (hjkl + стрелки) -----------------------------
        "$mod, h,     movefocus, l"
        "$mod, l,     movefocus, r"
        "$mod, k,     movefocus, u"
        "$mod, j,     movefocus, d"
        "$mod, left,  movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up,    movefocus, u"
        "$mod, down,  movefocus, d"

        # -- Перемещение окна -----------------------------------
        "$mod SHIFT, h,     movewindow, l"
        "$mod SHIFT, l,     movewindow, r"
        "$mod SHIFT, k,     movewindow, u"
        "$mod SHIFT, j,     movewindow, d"

        # -- Воркспейсы (switch) --------------------------------
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"

        # -- Воркспейсы (move window) — CTRL --------------------
        "$mod CTRL, 1, movetoworkspace, 1"
        "$mod CTRL, 2, movetoworkspace, 2"
        "$mod CTRL, 3, movetoworkspace, 3"
        "$mod CTRL, 4, movetoworkspace, 4"
        "$mod CTRL, 5, movetoworkspace, 5"

        # -- Скролл мышью по воркспейсам ------------------------
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up,   workspace, e-1"

        # -- Special Workspaces ---------------------------------
        "$mod, M, togglespecialworkspace, music"
        "$mod, C, togglespecialworkspace, comms"

        # -- Приложения (SHIFT) ---------------------------------
        "$mod SHIFT, Return, exec, $terminal"
        "$mod SHIFT, B,      exec, $browser"
        "$mod SHIFT, E,      exec, $editor"
        "$mod SHIFT, F,      exec, $files"
        "$mod SHIFT, M,      exec, spotify"
        "$mod SHIFT, T,      exec, telegram-desktop"
        "$mod SHIFT, D,      exec, discord"
        "$mod SHIFT, V,      exec, davinci-resolve"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      # ── Window Rules (новый синтаксис 0.53+) ──────────────────
      # Формат: "rule, match:field value"
      windowrule = [
        "match:class ^(pavucontrol)$, float on"
        "match:class ^(blueman-manager)$, float on"
        "match:class ^(Spotify)$, workspace special:music silent"
        "match:class ^(org.telegram.desktop)$, workspace special:comms silent"
        "match:class ^(discord)$, workspace special:comms silent"
        "match:class .*, suppress_event maximize"
      ];

      layerrule = [
        "blur on, match:namespace ^(waybar)$"
        "ignore_alpha 0.2, match:namespace ^(waybar)$"
      ];
    };
  };
}
