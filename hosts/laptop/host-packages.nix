{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    discord
    nodejs
    obs-studio
  ];
}
