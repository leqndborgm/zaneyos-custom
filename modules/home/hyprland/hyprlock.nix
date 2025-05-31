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
          border_color = "rgba(110, 80, 180, 0.6)"; # dunkles Violett, leicht transparent
          rounding = -1;
          position = "0, 0";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "250, 60";
          position = "0, 120"; # direkt unter dem Profilbild
          dots_center = true;
          fade_on_empty = false; # ← zeigt sofort den Hinweistext!
          placeholder_text = "Enter your passcode...";
          font_color = "rgba(220, 220, 255, 0.85)";
          inner_color = "rgba(130, 100, 200, 0.25)";
          outer_color = "rgba(25, 25, 25, 0.8)";
          outline_thickness = 5;
          rounding = 10;
          shadow_passes = 2;
        }
      ];

      label = [
        {
          text = "$USER";
          font_family = "JetBrainsMono Nerd Font";
          font_size = 16;
          color = "rgba(200, 200, 255, 0.8)";
          position = "0, 80"; # ↑ jetzt weiter **über** dem Bild
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
