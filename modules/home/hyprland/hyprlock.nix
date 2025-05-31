{
  config,
  pkgs,
  ...
}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        grace = 10;
        hide_cursor = true;
      };

      background = [
        {
          path = "${config.home.homeDirectory}/Pictures/Wallpapers/caberpunk.jpg";
          blur_passes = 2;
          blur_size = 6;
        }
      ];

      image = [
        {
          path = "${config.home.homeDirectory}/.config/face.jpg";
          size = 160;
          border_size = 4;
          border_color = "rgba(255, 85, 255, 0.8)"; # Neon Pink
          rounding = -1;
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "250, 60";
          position = "0, -80";
          dots_center = true;
          fade_on_empty = true;
          font_color = "rgba(255, 255, 255, 0.9)";
          inner_color = "rgba(255, 0, 255, 0.3)"; # Magenta glow
          outer_color = "rgba(20, 20, 20, 0.8)"; # Shadowy background
          outline_thickness = 6;
          rounding = 12;
          placeholder_text = "🔒 Enter your passcode...";
          shadow_passes = 3;
        }
      ];

      label = [
        {
          text = "$USER";
          font_family = "JetBrainsMono Nerd Font";
          font_size = 16;
          color = "rgba(200, 200, 255, 0.8)";
          position = "0, 290";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
