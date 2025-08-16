{ config, inputs, ... }:
let
  inherit (config.hostCfg) username;
in
{
  home-manager.users.${username} = {
    imports = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];
    programs.plasma.enable = true;
  };
}
