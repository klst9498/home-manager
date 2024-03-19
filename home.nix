{
  config,
  pkgs,
  ...
}: {
  imports = [./i3.nix ./zsh.nix];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "klst9498";
  home.homeDirectory = "/home/klst9498";

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  # Packages that should be installed to the user profile.
  home.keyboard.layout = "de";

  home.packages = with pkgs; [
    alejandra
    autojump
    cue
    feh
    zf
    fluxcd
    firefox
    go
    gum
    gnupg
    jq
    k3d
    k9s
    kustomize
    kompose
    kubectl
    krew
    kubernetes-helm
    source-code-pro
    terminator
    thefuck
    timoni
    tree
    vault
    velero
    vscode
    wget
  ];

  home.sessionPath = [
    "$HOME/.krew/bin"
    "$HOME/.local/bin" # for pipx
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.shellAliases = {
    # rebuild = "sudo nixos-rebuild switch";
    rebuild = "";
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.vim = {
    enable = true;
    settings = {
      relativenumber = true;
      number = true;
    };
    plugins = with pkgs.vimPlugins; [
      idris-vim
      sensible
      vim-airline
      The_NERD_tree # file system explorer
      fugitive
      vim-gitgutter # git
      vim-abolish
      command-t
    ];
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  #programs.home-manager.enable = true;

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  programs.git = {
    enable = true;
    userName = "Staudenmaier, Klaus";
    userEmail = "klaus.staudenmaier@elektrobit.com";
    aliases = {
      gst = "status";
    };
  };
}
