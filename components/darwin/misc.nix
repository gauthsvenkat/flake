{
  config,
  pkgs,
  ...
}: let
  inherit (config.hostCfg) username homeDirectory;
in {
  users.users.${username}.home = homeDirectory;

  system = {
    primaryUser = username;
    stateVersion = 6;
  };

  environment.systemPackages = [pkgs.darwin.xcode];
}
