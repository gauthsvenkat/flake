{ pkgs, username, ... }:
{
  imports = [
    ./disko-config.nix
    ./hardware-configuration.nix
    ../../common/boot.nix
    ../../common/nix-settings.nix
    ../../common/system.nix
    ../../common/users.nix
    ../../common/gui.nix
    ../../common/kanata.nix
    ../../common/laptop.nix
    ../../common/home-manager/development.nix
  ];

  services.fprintd.tod = {
    enable = true;
    driver = pkgs.libfprint-2-tod1-goodix;
  };

  home-manager.users.${username} = {
    home.packages = with pkgs; [
      _1password-gui
      slack
      k9s
      google-cloud-sdk
      helm
    ];
    programs.git.userEmail = "gautham@dexterenergy.ai";
  };
}
