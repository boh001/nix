{ pkgs, ... }:
{
  environment.systemPackages =
  [ 
    pkgs.vim
    pkgs.git
  ];

  services.nix-daemon.enable = true;

  nix.settings.experimental-features = "nix-command flakes";

  system.configurationRevision = null;

  programs.zsh.enable = true;

  system.stateVersion = 5;

  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.sanghyeon = {
    name = "sanghyeon";
    home = "/Users/sanghyeon";
  };

  fonts.packages = [
	  pkgs.nerd-fonts.jetbrains-mono
  ];

  system.defaults = {
    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      FXPreferredViewStyle = "icnv";
    };
    dock = {
      orientation = "left";
      autohide = true;
      persistent-apps = [
	      "/System/Applications/Launchpad.app"
	      "/System/Applications/System Settings.app"
	      "/System/Applications/Safari.app"
              "/System/Applications/Mail.app"
              "/Applications/Raycast.app"
	      "/Applications/KaKaoTalk.app"
	      "/Applications/ChatGPT.app"
	      "/Applications/Slack.app"
	      "/Applications/Alacritty.app"
	      "/Applications/Cursor.app"
	      "/Applications/GitKraken.app"
	      "/Applications/Xcode.app"
              "/Applications/CleanMyMac_5_MAS.app"
	    ]; 
    };
  };

  homebrew = {
    enable = true;
    brews = [
      "mas"
      "fnm"
    ];
    casks = [
      "chatgpt"
      "gitkraken"
      "cursor"
      "alacritty"
      "aldente"
      "docker"
      "raycast"
    ];
    masApps = {
      CleanMyMac = 1339170533;
      Xcode = 497799835;
      KaKaoTalk = 869223134;
    };
  };
}
