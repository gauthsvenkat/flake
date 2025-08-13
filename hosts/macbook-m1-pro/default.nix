{
  config,
  pkgs,
  ...
}: let
  inherit (config.hostCfg) username;
in {
  imports = [
    ../../components/config.nix
    ../../bases/workstation-mac.nix
  ];

  hostCfg = {
    hostname = "macbook-m1-pro";
    username = "gautham";
    gitEmail = "gautham@dexterenergy.ai";
    isLaptop = true;
    wallpaper = "neon_shallows.png";
  };

  home-manager.users.${username}.home.packages = with pkgs; [
    _1password-cli
    _1password-gui

    glab
    hurl
    k9s
    kubernetes-helm
    slack
    thunderbird

    (google-cloud-sdk.withExtraComponents [
      google-cloud-sdk.components.gke-gcloud-auth-plugin
      google-cloud-sdk.components.kubectl
    ])
  ];
}
