{
  description = "Personal nix flake for my various machines";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      mkNixosSystem =
        hostname: system: username:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit username hostname inputs;
          };
          modules = [ ./hosts/${hostname} ];
        };
    in
    {
      nixosConfigurations = {
        thinkpad = mkNixosSystem "thinkpad" "x86_64-linux" "ando";
        xps = mkNixosSystem "xps" "x86_64-linux" "gautham";
        elitedesk = mkNixosSystem "elitedesk" "x86_64-linux" "ando";
        nixpi = mkNixosSystem "nixpi" "aarch64-linux" "ando";
      };

      /* NOTE: raspi5 is maintained separately as there isn't an easy way to install
        NixOS on it. So we only have a home-manager configuration. */
      homeConfigurations."ando" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."aarch64-linux";
        modules = [
          ./hosts/raspi5
        ];
      };
    };
}
