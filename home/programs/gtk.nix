{pkgs, config, libs, catppuccin, ...}: 

{
  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "teal";
      icon = {
	enable = true;
	flavor = "mocha";
	accent = "teal";
      };
    };
  };
}
