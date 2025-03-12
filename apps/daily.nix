 { config, pkgs, ... }:
  {  environment.systemPackages = with pkgs; [
 	firefox
	ungoogled-chromium
	(discord-canary.override {
	withVencord= true;
	})
        (discord.override {
        # withOpenASAR = true; # can do this here too
         withVencord = true;
        })
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
