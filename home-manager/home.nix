{ config, pkgs, stylix, ... }:

{
  home.username = "cotunjr";
  home.homeDirectory = "/home/cotunjr";

  # Home Manager release version
  home.stateVersion = "24.11"; # Do not change unless necessary

  # User-specific packages
  home.packages = with pkgs; [
    # Add any packages you need for your user here
    neovim
  ];

  # Default applications (e.g., Okular for PDFs)
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
  "x-scheme-handler/http" = [ "org.chromium.desktop" ]; 
  "x-scheme-handler/https" = [ "org.chromium.desktop" ];
  "application/pdf" = [ "org.kde.okular.desktop" ];
    };
  };

#stylix.targets.kitty.enable = true;


#  stylix = {
#	enable = true;
#	base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
#  };
  # Enable Home Manager management for your dotfiles
  home.file = {
    # Example for dotfiles
    # ".bashrc".source = ./dotfiles/bashrc;
  };


  # Enable Home Manager itself
  programs.home-manager.enable = true;
  
  # Debugging (optional for debugging service issues)
#  home-manager.debug = true;
}
