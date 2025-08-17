{
  imports = [
    ../../../components/nixos/services/kanata.nix

    ../workstation.nix
  ];

  services = {
    tailscale.enable = true;

    # NOTE: power-profiles-daemon needs to be explicitly disabled
    # to enable tlp
    power-profiles-daemon.enable = false;
    tlp.enable = true;

    upower.enable = true;
  };
}
