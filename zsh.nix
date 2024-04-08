{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = ["brackets" "pattern" "cursor"];
    };
    enableAutosuggestions = true;
    enableCompletion = true;
    completionInit = true;
    dotDir = ".config/home-manager/zsh";
    initExtra = ''
      [[ ! -f  /home/klst9498/.config/home-manager/zsh/.p10k.zsh ]] || source /home/klst9498/.config/home-manager/zsh/.p10k.zsh
    '';
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [
      "autojump"
      "battery"
      "colorize"
      "docker"
      "fzf"
      "git-prompt"
      "git"
      "helm"
      "jira"
      "kubectl"
      "last-working-dir"
      "sudo"
      "terraform"
      "thefuck"
      "vault"
      "web-search"
      "z"
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

    {
      name = "zsh-nix-shell";
      file = "nix-shell.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "chisui";
        repo = "zsh-nix-shell";
        rev = "v0.8.0";
        sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
      };
    }
    {
      name = "history-sync";
      file = "history-sync.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "wulfgarpro";
        repo = "history-sync";
        rev = "v1.2.2";
        sha256 = "CoFJMr8TkUMUtpEDZBtGXBgGPuBFKEW9fuqqbtgOIHE=";
      };
    }
  ];

  programs.zsh.shellAliases = {
    kgpo = "kubectl get pods";
    kg = "kubectl get";
  };
}
