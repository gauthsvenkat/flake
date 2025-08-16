{ config, ... }:
let
  inherit (config.hostCfg) username;
in
{
  home-manager.users.${username}.programs.plasma.kscreenlocker = {
    appearance = {
      alwaysShowClock = true;
      showMediaControls = true;
      wallpaperPictureOfTheDay.provider = "natgeo";
    };

    autoLock = true;
    lockOnResume = true;
    timeout = 15; # minutes
  };
}
