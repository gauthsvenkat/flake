{
  pkgs,
  username,
  ...
}: {
  home-manager.users.${username} = {
    home = {
      packages = [pkgs.aider-chat-full];
      sessionVariables.AIDER_VIM = "true";
    };

    programs = {
      zsh.shellAliases."ai" = "${pkgs.aider-chat}/bin/aider";
      git.ignores = [".aider*"];
    };
  };
}
