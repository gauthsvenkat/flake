{ pkgs, ... }:
let
  username = "ando";
  homeDirectory = "/home/${username}";
in
{
  imports = [ ./programs ];

  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 2d";
    };
  };

  targets.genericLinux.enable = true;
  fonts.fontconfig.enable = true;

  home = {
    stateVersion = "24.11"; # Don't change this
    inherit username;
    inherit homeDirectory;
    sessionVariables = {
      "EDITOR" = "nvim";
    };

    packages = with pkgs; [
      pre-commit
      nixfmt-rfc-style
      just
    ];
  };
}
