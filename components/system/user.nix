{config, ...}: let
  inherit (config.hostCfg) username;
in {
  users.users.${username} = {
    isNormalUser = true;
    initialHashedPassword = "$y$j9T$SJ0epNFtxai404cAmP3og.$ZE9wG79uafBAE3.G2LGdzwDcAl35FdWtc3OelOU10C6";
    extraGroups = ["wheel"];
  };
}
