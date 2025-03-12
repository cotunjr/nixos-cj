 { config, pkgs, ... }:
  {  environment.systemPackages = with pkgs; [
 	firefox
	ungoogled-chromium
	discord-canary
	anydesk
	spotify
	telegram-desktop
	kdePackages.filelight
	gparted
	rivalcfg
	kdePackages.okular
	prismlauncher
	kdePackages.dolphin
  ];
  programs.steam = {
	enable = true;
	dedicatedServer.openFirewall = true;
	localNetworkGameTransfers.openFirewall = true;
 };
 services.flatpak = {
	enable = true;
 };
}
