{config, ...}: {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "shutdown";
        action = "sleep 1; systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "sleep 1; systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "logout";
        action = "sleep 1; hyprctl dispatch exit";
        text = "Exit";
        keybind = "e";
      }
      {
        label = "suspend";
        action = "sleep 1; systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "lock";
        action = "sleep 1; hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "sleep 1; systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
    ];
    style = ''
      /* ---------------------------------------------------------
         Neuer Cyberpunk-Ansatz: Glasige Transparenz + Neon-Konturen
         - Sehr transparente Flächen, „Frosted Glass“-Look
         - Neon-Konturen und Textschatten
         - Futuristische Font: Eurostile (oder JetBrainsMono NF als Fallback)
         - Icons mit farbigen Neon-Dropshadows
      --------------------------------------------------------- */

      * {
        font-family: "Eurostile", "JetBrainsMono NF", sans-serif;
        transition: 100ms ease-in-out;
      }

      window {
        /* Sehr transparente Hintergrundfläche */
        background-color: rgba(  0,   0,   0, 0.15 );
        /* Dünner, neonfarbener Rahmen */
        border: 2px solid #ff0080;
        border-radius: 12px;
        /* Leichter äußerer Leuchteffekt */
        box-shadow: 0 0 20px rgba(255, 0, 128, 0.4);
      }

      button {
        /* Glasige Transparenz */
        background-color: rgba(  0,   0,   0, 0.08 );
        /* Neon-Kontur (Pink) */
        border: 2px solid #ff0080;
        border-radius: 50%;
        /* Neon-Pink-Text mit leichtem Glow */
        color: #ff0080;
        font-size: 20px;
        font-weight: 600;
        text-shadow: 0 0 6px #ff0080;
        /* Icon zentrieren */
        background-repeat: no-repeat;
        background-position: center;
        background-size: 32%;
        /* Platz für Text unter dem Icon freihalten */
        padding: 20px;
        margin: 12px;
      }

      button:hover,
      button:focus,
      button:active {
        /* Hover: Cyan-Neon statt Pink, etwas stärkere Deckkraft */
        background-color: rgba(  0,   0,   0, 0.20 );
        border-color: #00ffff;
        color: #00ffff;
        text-shadow: 0 0 8px #00ffff;
        /* Neon-Glühen */
        box-shadow: 0 0 25px rgba(0, 255, 255, 0.5), inset 0 0 10px rgba(0, 255, 255, 0.3);
        transform: scale(1.08);
      }

      /* Text unter jedem Icon */
      button > span {
        display: block;
        margin-top: 8px;
        font-size: 14px;
        text-transform: uppercase;
        letter-spacing: 1px;
      }

      /* ---------------------------------------------------------
         Icons mit individuellen Neon-Dropshadows
         (Icon-Dateien bitte in ~/.config/wlogout/icons/*.png ablegen)
      --------------------------------------------------------- */
      #shutdown {
        background-image: image(url("icons/shutdown.png"));
        filter: drop-shadow(0 0 5px #ff0080) drop-shadow(0 0 10px #ff0080);
      }
      #reboot {
        background-image: image(url("icons/reboot.png"));
        filter: drop-shadow(0 0 5px #00ffff) drop-shadow(0 0 10px #00ffff);
      }
      #logout {
        background-image: image(url("icons/logout.png"));
        filter: drop-shadow(0 0 5px #ff0080) drop-shadow(0 0 10px #ff0080);
      }
      #suspend {
        background-image: image(url("icons/suspend.png"));
        filter: drop-shadow(0 0 5px #00ff00) drop-shadow(0 0 10px #00ff00);
      }
      #lock {
        background-image: image(url("icons/lock.png"));
        filter: drop-shadow(0 0 5px #ff0080) drop-shadow(0 0 10px #ff0080);
      }
      #hibernate {
        background-image: image(url("icons/hibernate.png"));
        filter: drop-shadow(0 0 5px #00ffff) drop-shadow(0 0 10px #00ffff);
      }
    '';
  };

  home.file.".config/wlogout/icons" = {
    source = ./icons;
    recursive = true;
  };
}
