 { config, pkgs, ... }:
  {  environment.systemPackages = with pkgs; [
	ungoogled-chromium
	anydesk
	spotify
	telegram-desktop
	kdePackages.filelight
	gparted
	rivalcfg
	kdePackages.okular
	prismlauncher
	kdePackages.dolphin
	vesktop
	gpu-screen-recorder-gtk
	librewolf
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
