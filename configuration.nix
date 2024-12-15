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
      autohide = true;
      persistent-apps = [
	      "/System/Applications/Launchpad.app"
	      "/System/Applications/System Settings.app"
	      "/Applications/Google Chrome.app"
	      "/Applications/KaKaoTalk.app"
	      "/Applications/ChatGPT.app"
	      "/Applications/Notion.app"
	      "/Applications/Notion Calendar.app"
	      "/Applications/Slack.app"
	      "/Applications/Alacritty.app"
	      "/Applications/Cursor.app"
	      "/Applications/GitKraken.app"
	      "/Applications/Android Studio.app"
	      "/Applications/Xcode.app"
	    ]; 
    };
  };

  homebrew = {
    enable = true;
    brews = [
      "mas"
      "fnm"
      "rbenv"
      "awscli"
      "fzf"
      "bat"
    ];
    casks = [
      "google-chrome"
      "chatgpt"
      "notion"
      "notion-calendar"
      "gitkraken"
      "cursor"
      "temurin@17"
      "android-studio"
      "slack"
      "alacritty"
      "aldente"
    ];
    masApps = {
      RunCat = 1429033973;
      Xcode = 497799835;
      KaKaoTalk = 869223134;
    };
  };
}