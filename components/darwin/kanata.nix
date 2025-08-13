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

  launchd.daemons.kanata = {
    script = ''
      exec /opt/homebrew/bin/kanata --cfg /Users/${username}/.config/kanata/kanata.kbd
    '';
    serviceConfig = {
      Label = "org.homebrew.kanata";
      KeepAlive = true;
      RunAtLoad = true;
      StandardErrorPath = "/var/log/kanata.log";
      StandardOutPath = "/var/log/kanata.log";
    };
  };
}
