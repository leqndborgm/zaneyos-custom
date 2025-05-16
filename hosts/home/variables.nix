{
  # Git Configuration
  gitUsername = "leqndborgm";
  gitEmail = "bothe.martin@gmx.de";

  # Hyprland Settings
  extraMonitorSettings = "";

  # Waybar Settings
  clock24h = true;

  # Program Options
  browser = "brave";
  terminal = "kitty";
  keyboardLayout = "de";
  consoleKeyMap = "de";

  # For Nvidia Prime support
  intelID = "PCI:1:0:0";
  nvidiaID = "PCI:0:2:0";

  # Enable NFS
  enableNFS = true;

  # Enable Printing Support
  printEnable = false;

  # Set Stylix Image
  stylixImage = ../../wallpapers/AnimeGirlNightSky.jpg;

  # Set Waybar
  waybarChoice = ../../modules/home/waybar/waybar-simple.nix;

  # Set Animation style
  animChoice = ../../modules/home/hyprland/animations-def.nix;

  # Enable Thunar GUI File Manager
  thunarEnable = false;
}
