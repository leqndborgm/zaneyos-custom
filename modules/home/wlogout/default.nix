{
  config,
  pkgs,
  ...
}: {
  programs.wlogout = {
    enable = true;

    layout = [
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Exit";
        keybind = "e";
      }
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
      }
    ];

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", sans-serif;
        transition: all 0.3s ease;
        background-image: none;
      }

      window {
        background-color: rgba(10, 10, 20, 0.85);
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
      }

      #buttons {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        gap: 30px;
      }

      button {
        background: transparent;
        border: none;
        color: #${config.lib.stylix.colors.base05};
        font-size: 24px;
        padding: 20px 80px;
        border-radius: 9999px;
        text-transform: uppercase;
        letter-spacing: 2px;
        box-shadow: 0 0 10px rgba(110, 80, 180, 0.2);
        transform: scale(1);
        opacity: 0.9;
      }

      button:hover {
        color: #${config.lib.stylix.colors.base0E};
        background-color: rgba(110, 80, 180, 0.1);
        box-shadow: 0 0 14px rgba(150, 100, 220, 0.5);
        transform: scale(1.05);
        opacity: 1;
      }

      button:focus {
        outline: none;
        transform: scale(1.1);
        box-shadow: 0 0 20px rgba(150, 100, 220, 0.8);
      }
    '';
  };
}
