alias a := apply
alias c := check
alias u := update

os := os()
nh_subcommand := if os == "linux" { "os" } else if os == "macos" { "darwin" } else { error("Unsupported OS!") }

apply action='switch':
    nh {{ nh_subcommand }} {{ action }} .

check:
    nix flake check

update input="":
    nix flake update {{ input }}

upgrade:
    just update
    git add flake.lock
    just apply boot || (git checkout HEAD -- flake.lock && exit 1)
    git commit -m "upgrade: on {{ datetime('%Y-%m-%d') }}"

secrets-edit:
    sops edit secrets.yaml

secrets-view:
    sops decrypt secrets.yaml

secrets-rekey:
    sops updatekeys secrets.yaml

[confirm]
nixos-install hostname ip:
    nix run github:nix-community/nixos-anywhere -- \
      --generate-hardware-config nixos-generate-config \
      ./hosts/{{ hostname }}/hardware-configuration.nix \
      --flake .#{{ hostname }} \
      --target-host root@{{ ip }}

[confirm]
nixos-test hostname:
    nix run github:nix-community/nixos-anywhere -- \
      --flake .#{{ hostname }} \
      --vm-test
