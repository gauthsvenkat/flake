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
      (google-cloud-sdk.withExtraComponents [
        google-cloud-sdk.components.gke-gcloud-auth-plugin
        google-cloud-sdk.components.kubectl
      ])
      k9s
      kubernetes-helm
      thunderbird
      libreoffice-still
    ];
    programs.git.userEmail = "gautham@dexterenergy.ai";
  };
}
