{ config, pkgs, lib, ... }:
  {  environment.systemPackages = with pkgs; [
	fastfetch
	zsh
	btop
	git
	dotnet-sdk
	jetbrains.rider
	openssl
	mokutil
	tree
	powerline-fonts
	testdisk
	cargo
	rustc
	gcc
	gnumake
	openssh
  ];

 # For dotnet thingy 
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
	jetbrains.rider
 ];
 # ZSH kralll 
 users.defaultUserShell = pkgs.zsh;
 environment.shells = with pkgs; [zsh];

 home-manager.backupFileExtension = "backup";
 programs.zsh = {
   enable = true;
   autosuggestions.enable = true; 
   syntaxHighlighting.enable = true; 
   shellAliases = {
	update = "sudo nixos-rebuild switch --upgrade --flake /etc/nixos/";
	editapps = "sudo nano /etc/nixos/apps/daily.nix"; 
	editconfig = "sudo nano /etc/nixos/configuration.nix";
	editcli = "sudo nano /etc/nixos/cli-things/cli.nix";
        editflake = "sudo nano /etc/nixos/flake.nix";
	sd = "sudo shutdown now";
	edit-home = "sudo nano /etc/nixos/home-manager/home.nix";
	rb = "sudo reboot now";
	edit-dot = "sudo nano /etc/nixos/home-manager/dot.nix";
    }; 
   ohMyZsh = {
	enable = true;   
	theme = "robbyrussell";
  };
 };
}
