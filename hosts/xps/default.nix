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

  # NOTE: Fingerprint disabled since it is very annoying
  # services.fprintd.tod = {
  #   enable = true;
  #   driver = pkgs.libfprint-2-tod1-goodix;
  # };

  programs = {
    _1password.enable = true;
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ username ];
    };
  };

  home-manager.users.${username} = {
    home = {
      packages = with pkgs; [
        slack
        (google-cloud-sdk.withExtraComponents [
          google-cloud-sdk.components.gke-gcloud-auth-plugin
          google-cloud-sdk.components.kubectl
        ])
        k9s
        kubernetes-helm
        thunderbird
        libreoffice-still
        hurl
        jq
        pkg-config
      ];
      sessionVariables = {
        # Needed for compiling rust apps that depend on openssl
        PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
      };
    };

    programs.git.userEmail = "gautham@dexterenergy.ai";

    xdg.autostart.entries = [
      "${pkgs.slack}/share/applications/slack.desktop"
      "${pkgs.thunderbird}/share/applications/thunderbird.desktop"
    ];
  };
}
