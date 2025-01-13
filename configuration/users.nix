{ pkgs, ... }:
{
  users.users.ando = {
    isNormalUser = true;
    hashedPassword = "$y$j9T$uSxCEmzPzFZlLnV2jcJJT0$b1EeEejq97Bvgqa9uyRoFkbxv8bpapKJWqy6sHpQM16";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
}
