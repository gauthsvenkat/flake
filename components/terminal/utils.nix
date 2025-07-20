{
  config,
  pkgs,
  ...
}: let
  inherit (config.hostCfg) username;
in {
  home-manager.users.${username}.home.packages = with pkgs; [
    curl
    fd
    jq
    just
    ripgrep
    unzip
    wget
    zip
  ];
}
