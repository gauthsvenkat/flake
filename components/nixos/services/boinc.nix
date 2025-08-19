{ config, pkgs, ... }:
{
  sops.secrets."boincRosettaXml" = {
    path = "${config.services.boinc.dataDir}/account_boinc.bakerlab.org_rosetta.xml";
    owner = "boinc";
    group = "boinc";
  };

  services.boinc = {
    enable = true;
    package = pkgs.boinc-headless;
  };
}
