{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting = {
      enable = true;
      highlighters  = ["brackets" "pattern" "cursor"];
    };
    enableAutosuggestions = true;
    enableCompletion = true;
    completionInit  = true;
    dotDir = ".config/home-manager/zsh";
    initExtra = ''
      [[ ! -f  /home/klst9498/.config/home-manager/zsh/.p10k.zsh ]] || source /home/klst9498/.config/home-manager/zsh/.p10k.zsh
    '';
  };

  programs.zsh.oh-my-zsh= {
    enable = true;
        plugins = [
         "battery"
         "colorize"
         "docker"
         "git-prompt"
         "git"
#         "history-sync"
         "kubectl"
#         "k3d"
         "last-working-dir"
         "terraform"
         "thefuck"
         "helm"
         "fzf"
         "vault"
         "sudo"
         "web-search"
         "z"
         "jira"
         "autojump"
       ];
	theme = "dpoggi";
  };

  programs.zsh.plugins = [
  {
    name = "powerlevel10k";
    src = pkgs.zsh-powerlevel10k;
    file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  }
  {
    name = "powerlevel10k-config";
    src = ./zsh;
    file = ".p10k.zsh";
  }
  ];

}
