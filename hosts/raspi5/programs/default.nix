{
  imports = [ ./zsh.nix ];

  programs = {
    home-manager.enable = true;
    fastfetch.enable = true;
    eza.enable = true;
    fzf.enable = true;
    bat.enable = true;
    ripgrep.enable = true;
    lazygit.enable = true;
    direnv.enable = true;
    nh.enable = true;

    zoxide = {
      enable = true;
      options = [
        "--cmd j"
      ];
    };

    git = {
      enable = true;
      lfs.enable = true;
      userEmail = "gauthsvenkat@gmail.com";
      userName = "Gautham Venkataraman";
    };

    btop = {
      enable = true;
      settings = {
        color_theme = "gruvbox_dark";
        update_ms = 1000;
        proc_tree = true;
      };
    };
  };
}
