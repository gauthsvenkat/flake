{ config, ... }:
let
  inherit (config.hostCfg) username hostname;
in
{
  sops.secrets.foldingathomePasskey = { };

  services.foldingathome = {
    enable = true;
    user = "gauthsvenkat";
    extraArgs = [
      "--machine-name"
      "${username}@${hostname}"
      "--passkey"
      "$(cat ${config.sops.secrets.foldingathomePasskey.path})"
    ];
  };
}
