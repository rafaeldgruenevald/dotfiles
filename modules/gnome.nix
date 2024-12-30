{ config, pkgs, ... }:

{
  home.packages = with pkgs.gnomeExtensions; [
    appindicator
    caffeine
    forge
    search-light
    blur-my-shell
  ];
  dconf.settings = {
    # GNOME Shell Extensions
    "org/gnome/shell" = {
      disable-user-extensions = false;
      disable-extensions = [];
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "caffeine@patapon.info"
	"forge@jmmaranan.com"
	"search-light@icedman.github.com"
        "blur-my-shell@aunetx"
      ];
    };
    # GNOME Forge Extension Config 
    "org/gnome/shell/extensions/forge" = {
      stacked-tiling-mode-enabled = false;
      tabbed-tiling-mode-enabled = false;
      tiling-mode-enabled = true;
    };
    "org/gnome/shell/extensions/forge/keybindings" = {
      prefs-tiling-toggle = []; 
      window-swap-last-active = [];
    };
    # GNOME Search-Light Config
    "org/gnome/shell/extensions/search-light" = {
      shortcut-search = ["<Shift><Super>Return"];
    };
    # GNOME Desktop Keybinds
    "org/gnome/desktop/wm/keybindings" = {
      toggle-maximized = [];
      maximize = [];
      minimize = [];
      unmaximize = [];

      begin-move = [];
      begin-resize = [];

      close = ["<Super>q"];

      activate-window-menu = [];

      cycle-group = [];
      cycle-group-backward = [];

      cycle-windows = [];
      cycle-windows-backward = [];

      move-to-monitor-down = [];
      move-to-monitor-left = [];
      move-to-monitor-right = [];
      move-to-monitor-up = [];

      move-to-workspace-last = [];
      move-to-workspace-left = [];
      move-to-workspace-right = [];

      move-to-workspace-1 = ["<Shift><Super>1"];
      move-to-workspace-2 = ["<Shift><Super>2"];
      move-to-workspace-3 = ["<Shift><Super>3"];
      move-to-workspace-4 = ["<Shift><Super>4"];
      move-to-workspace-5 = ["<Shift><Super>5"];
      move-to-workspace-6 = ["<Shift><Super>6"];
      move-to-workspace-7 = ["<Shift><Super>7"];
      move-to-workspace-8 = ["<Shift><Super>8"];
      move-to-workspace-9 = ["<Shift><Super>9"];
      move-to-workspace-10 = ["<Shift><Super>0"];

      switch-to-workspace-last = [];
      switch-to-workspace-left = [];
      switch-to-workspace-right = [];

      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      switch-to-workspace-5 = ["<Super>5"];
      switch-to-workspace-6 = ["<Super>6"];
      switch-to-workspace-7 = ["<Super>7"];
      switch-to-workspace-8 = ["<Super>8"];
      switch-to-workspace-9 = ["<Super>9"];
      switch-to-workspace-10 = ["<Super>0"];

      switch-input-source = ["<Alt>space"];
      switch-input-source-backward = ["<Shift><Alt>space"];

      switch-group = [];
      switch-group-backward = [];

      panel-run-dialog = [];
    };
    # GNOME Desktop Preferences
    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 10;
    };
    # GNOME Shell Keybindings
    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
      switch-to-application-5 = [];
      switch-to-application-6 = [];
      switch-to-application-7 = [];
      switch-to-application-8 = [];
      switch-to-application-9 = [];
      switch-to-application-10 = [];

      focus-active-notification = [];

      toggle-application-view = [];
      toggle-message-tray = [];
      toggle-quick-settings = [];
    };
    # GNOME Mutter 
    "org/gnome/mutter" = {
      workspaces-only-on-primary = true;
    };
    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [];
      toggle-tiled-right = [];
    };
    "org/gnome/mutter/wayland/keybindings" = {
      restore-shortcuts = [];
    };
    # GNOME Extensions
    "org/gnome/Extensions" = {
      window-maximized = true;
    };
    # GNOME Media-Keys
    "org/gnome/settings-daemon/plugins/media-keys" = {
      help = [];
      logout = [];
      magnifier = [];
      magnifier-zoom-in = [];
      magnifier-zoom-out = [];
      screenreader = [];
      screensaver = [];
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
      ];
    };
    # GNOME Custom Keybindings
    # Launch Firefox
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Lauch Firefox";
      command = "firefox";
      binding = "<Super>w";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "Lauch Terminal";
      command = "nixGL ghostty";
      binding = "<Super>Return";
    };
  };
}
