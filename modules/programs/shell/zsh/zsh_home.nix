{ pkgs, config, ... }:

{
  programs.zoxide = {
    enable = true;
    enableZshIntegration = false;
  };

  programs.oh-my-posh = {
    enable = true;
    useTheme = "microverse-power";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "colored-man-pages"
        "zoxide"
        "sudo"
      ];
    };
  };
}
