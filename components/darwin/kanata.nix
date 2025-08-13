{config, ...}: let
  inherit (config.hostCfg) username;
in {
  homebrew = {
    brews = ["kanata"];
    casks = ["karabiner-elements"];
  };

  home-manager.users.${username}.home.file.".config/kanata/kanata.kbd".text = ''
    (defcfg
      process-unmapped-keys yes
    )

    ${builtins.readFile ../../notnix/configs/kanata.kbd}
  '';
}
