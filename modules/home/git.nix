{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name  = "oxtomoe";
        email = "213279281+oxtomoe@users.noreply.github.com";
      };

      hub.protocol = "https";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;

      core = {
        editor = "vim";
        autocrlf = "input";
      };

      color.ui = true;

      # Настраиваем gh как credential helper заранее
      "credential \"https://github.com\"" = {
        helper = "!${pkgs.gh}/bin/gh auth git-credential";
      };
      "credential \"https://gist.github.com\"" = {
        helper = "!${pkgs.gh}/bin/gh auth git-credential";
      };

      include.path = "~/.config/git/config.local";
    };

    ignores = [
      ".DS_Store"
      "*.swp"
      ".direnv"
      ".env"
    ];
  };
}
