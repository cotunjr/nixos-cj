{ config, pkgs, stylix, ... }:

{
  home.username = "cotunjr";
  home.homeDirectory = "/home/cotunjr";

  # Home Manager release version
  home.stateVersion = "24.11"; # Do not change unless necessary
  # Enable Home Manager management for your dotfiles
  
# idk how to use home manager 

  # Enable Home Manager itself
  programs.home-manager.enable = true;
}
