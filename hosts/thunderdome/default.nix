{
  username,
  ...
}:
let
  zpool = "wombocombo";
in
{
  imports = [
    ./hardware-configuration.nix

    ../../common/boot.nix
    ../../common/system.nix
    ../../common/users.nix
    ../../common/nix-settings.nix
    ../../common/gui.nix

    ../../common/personal.nix
    ../../common/development.nix

    ../../common/services/syncthing.nix
    ../../common/services/zfs.nix
  ];

  # If enabled, the boot process get randomly stuck on "A start job
  # is running for /dev/tpmrm0".
  systemd.tpm2.enable = false;

  boot.zfs.extraPools = [ zpool ];
  services.sanoid.datasets."${zpool}".use_template = [ "default" ];

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    graphics.enable = true;
    nvidia = {
      open = false;
      modesetting.enable = true;
    };
  };

  programs.steam.enable = true;

  home-manager.users.${username}.programs.git.userEmail = "gauthsvenkat@gmail.com";
}
