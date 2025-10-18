{
  pkgs,
  lib,
  host,
  config,
  ...
}: let
  inherit (import ../../../hosts/${host}/variables.nix);
in
  with lib; {
    programs.waybar = {
      enable = true;
      package = pkgs.waybar;
      style = ./waybar.css;
      settings = [
        {
          layer = "top";
          position = "top";

          modules-left = [
            "custom/home"
            "pulseaudio"
            "cpu"
            "disk"
            "memory"
            "idle_inhibitor"
            "hyprland/window"
          ];
          modules-center = ["clock"];
          modules-right = [
            "custom/notification"
            "custom/lock"
            "battery"
            "network"
            "tray"
            "hyprland/workspaces"
          ];

          "custom/home" = {
            tooltip = false;
            format = "🌸";
            on-click = "sleep 0.15 && rofi-launcher";
          };

          "pulseaudio" = {
            format = "{icon} {volume}%";
            format-icons = {default = ["🔇" "🔈" "🔉" "🔊"];};
            on-click = "sleep 0.15 && pavucontrol";
          };

          "cpu" = {
            interval = 5;
            format = " {usage:2}%";
          };
          "disk" = {
            interval = 5;
            format = "📥{free}";
          };
          "memory" = {
            interval = 5;
            format = "💾{percentage}%";
          };

          "idle_inhibitor" = {
            format = "{icon}";
            format-icons = {
              activated = "";
              deactivated = "";
            };
            tooltip = true;
          };

          "hyprland/window" = {
            format = "{}";
            separate-outputs = false;
            rewrite = {"^$" = "No windows 🤫";};
            max-length = 60;
          };

          "clock" = {
            interval = 1;
            format = "{:%H:%M:%S}";
            tooltip = true;
            tooltip-format = "<big>{:%A, %d.%B %Y}</big>\n<tt><small>{calendar}</small></tt>";
          };

          "custom/notification" = {
            tooltip = false;
            format = "{icon}";
            format-icons = {
              notification = "<span foreground='red'><sup></sup></span>";
              none = "";
            };
            return-type = "json";
            exec-if = "which swaync-client";
            exec = "swaync-client -swb";
            on-click = "sleep 0.1 && task-waybar";
            escape = true;
          };

          "custom/lock" = {
            format = "🔒";
            on-click = "sleep 0.15 && wlogout";
          };

          "battery" = {
            interval = 5;
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{icon} {capacity}%";
            format-charging = "🔌{capacity}%";
            format-icons = ["🪫" "🔋"];
            tooltip = false;
          };

          "network" = {
            format-wifi = "{signalStrength}%";
            format-ethernet = "󰈁";
            tooltip = false;
          };

          "tray" = {spacing = 10;};

          "hyprland/workspaces" = {
            format = "{name}";
            on-scroll-up = "hyprctl dispatch workspace e+1";
            on-scroll-down = "hyprctl dispatch workspace e-1";
          };
        }
      ];
    };
  }
