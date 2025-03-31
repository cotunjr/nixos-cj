
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
	protonup-qt
	protonvpn-gui
	tor-browser
	protonvpn-cli
	qbittorrent-enhanced
	firefox
        piper
	libratbag
	rustdesk
  ];
  programs.steam = {
	enable = true;
	dedicatedServer.openFirewall = true;
	localNetworkGameTransfers.openFirewall = true;
	gamescopeSession.enable = true;
 };
 services.flatpak = {
	enable = true;
 };
}
