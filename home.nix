{ pkgs, ... }:

{
  home.stateVersion = "25.05";

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  xdg.configFile.nvim = {
    source = ./nvim;
    recursive = true;
  };

  programs.git  = {
    enable = true;
    userName = "sanghyeon.kim";
    userEmail = "boh001g@gmail.com";
    extraConfig = {
      init = { defaultBranch = "main"; };
      push = { autoSetupRemote = true; };
    };
  };

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    oh-my-zsh = {
      enable = true;
      theme = "apple";
    };
    zplug = {
      enable = true;
      plugins = [
        {
          name = "zsh-users/zsh-syntax-highlighting";
        }
        {
          name = "zsh-users/zsh-autosuggestions";
        }
        {
          name = "zsh-users/zsh-completions";
        }
      ];
    };
    initExtra = ''
      # git
      export GIT_EDITOR="nvim"

      # fnm
      eval "$(fnm env --use-on-cd --shell zsh)"

      # rbenv
      export PATH="$HOME/.rbenv/bin:$PATH"
      eval "$(rbenv init - zsh)"

      # android studio
      export ANDROID_HOME=$HOME/Library/Android/sdk
      export PATH=$PATH:$ANDROID_HOME/emulator
      export PATH=$PATH:$ANDROID_HOME/platform-tools

      # trash
      export PATH="/opt/homebrew/opt/trash-cli/bin:$PATH"
    '';
    shellAliases = {
      darwin-rebuild-main = "darwin-rebuild switch --flake ~/.config/nix#main";
    };
  };

  programs.fzf = {
    enable = true;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        startup_mode = "Fullscreen";
      };

      font = {
        normal = { family = "JetBrainsMono Nerd Font"; style = "Regular"; };
        bold = { family = "JetBrainsMono Nerd Font"; style = "Bold"; };
        italic = { family = "JetBrainsMono Nerd Font"; style = "Italic"; };
        size = 16;
      };

      terminal = {
        osc52 = "CopyPaste";
        shell = { program = "/bin/zsh"; };
      };

      env = {
        TERM = "xterm-256color";
      };

      general = {
        live_config_reload = true;
      };

      colors = {
        primary = {
          background = "0x282a36"; # 배경 색상
          foreground = "0xf8f8f2"; # 전경 색상
        };
        cursor = {
          text = "0x282a36";
          cursor = "0xf8f8f2";
        };
        normal = {
          black = "0x21222c";     # Dracula black
          red = "0xf07178";       # Dracula red
          green = "0x50fa7b";     # Dracula green
          yellow = "0xf1fa8c";    # Dracula yellow
          blue = "0xbd93f9";      # Dracula blue
          magenta = "0xff79c6";   # Dracula magenta
          cyan = "0x8be9fd";      # Dracula cyan
          white = "0xf8f8f2";     # Dracula white
        };
        bright = {
          black = "0x6272a4";     # Dracula bright black
          red = "0xff5555";       # Dracula bright red
          green = "0x50fa7b";     # Dracula bright green
          yellow = "0xf1fa8c";    # Dracula bright yellow
          blue = "0xbd93f9";      # Dracula bright blue
          magenta = "0xff79c6";   # Dracula bright magenta
          cyan = "0x8be9fd";      # Dracula bright cyan
          white = "0xffffff";     # Dracula bright white
        };
      };
    };
  };
}
