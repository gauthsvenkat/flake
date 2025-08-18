{
  config,
  ...
}:
let
  inherit (config.hostCfg) username homeDirectory;
in
{
  home-manager.users.${username} = {

    programs.claude-code = {
      enable = true;

      mcpServers = {
        context7 = {
          type = "http";
          url = "https://mcp.context7.com/mcp";
        };
      };

      settings = {
        theme = "dark";

        includeCoAuthoredBy = false;

        permissions = {
          deny = [
            "Read(./.env*)"
            "Read(${homeDirectory}/.ssh/*)"
          ];
        };
      };
    };

    home.sessionVariables.DISABLE_TELEMETRY = 1;

    programs.git.ignores = [
      ".claude/"
      "CLAUDE.local.md"
    ];
  };
}
