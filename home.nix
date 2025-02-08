{ pkgs, ... }:

{
  home.stateVersion = "25.05";

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  home.file.".config/nvim" = {
    source = ./nvim;
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
          background = "0x101010";
          foreground = "0xf5f5f5";
        };

        cursor = {
          text = "0x101010";
          cursor = "0x3ecf8e";
        };

        selection = {
          text = "0xf5f5f5";
          background = "0x232323";
        };

        normal = {
          black = "0x101010";
          red = "0xff6060";
          green = "0x3ecf8e";
          yellow = "0x2596be";
          blue = "0xa0a0a0";
          magenta = "0xb6a6f7";
          cyan = "0x3ecf8e";
          white = "0xf5f5f5";
        };

        bright = {
          black = "0x232323";
          red = "0xffadad";
          green = "0x3ecf8e";
          yellow = "0x2596be";
          blue = "0x505050";
          magenta = "0xb6a6f7";
          cyan = "0x3ecf8e";
          white = "0xf5f5f5";
        };
      };
    };
  };
}
