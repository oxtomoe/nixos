{ pkgs, ... }:

let
  colors = (import ../../themes/rose-pine.nix).theme;
in
{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting ""
    '';

    shellAliases = {
      # Nix
      rebuild = "nh os switch ~/nixos";
      update = "nh flake update ~/nixos";
      gc = "nh clean all";

      # Navigation
      ".." = "cd ..";
      "..." = "cd ../..";

      # Utils
      ls = "ls --color=auto";
      ll = "ls -la --color=auto";
      cat = "bat";
      rm = "rm -i";
      doom = "~/.config/emacs/bin/doom";
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      format = "$directory$git_branch$git_status$nix_shell$cmd_duration$line_break$character";

      character = {
        success_symbol = "[❯](bold #${builtins.replaceStrings [ "#" ] [ "" ] colors.iris})";
        error_symbol = "[❯](bold #${builtins.replaceStrings [ "#" ] [ "" ] colors.love})";
      };

      directory = {
        style = "bold #${builtins.replaceStrings [ "#" ] [ "" ] colors.foam}";
        truncation_length = 3;
        truncate_to_repo = true;
      };

      git_branch = {
        symbol = " ";
        style = "#${builtins.replaceStrings [ "#" ] [ "" ] colors.pine}";
        format = "[$symbol$branch]($style) ";
      };

      git_status = {
        style = "#${builtins.replaceStrings [ "#" ] [ "" ] colors.gold}";
        format = "([$all_status$ahead_behind]($style) )";
      };

      nix_shell = {
        symbol = " ";
        style = "#${builtins.replaceStrings [ "#" ] [ "" ] colors.iris}";
        format = "[$symbol$state]($style) ";
      };

      cmd_duration = {
        style = "#${builtins.replaceStrings [ "#" ] [ "" ] colors.muted}";
        format = "[ $duration]($style) ";
        min_time = 2000;
      };
    };
  };

  # bat — замена cat с подсветкой
  programs.bat = {
    enable = true;
    config.theme = "base16";
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.packages = with pkgs; [
    fd
    ripgrep
    htop
    nil
    nixd
    nixpkgs-fmt
    nix-index
    nix-search-cli
    shfmt
    shellcheck
  ];
}
