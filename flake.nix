{
  description = "Cambridge typst materials";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        typst
        liberation_ttf
      ];
      TYPST_FONT_PATHS = "${pkgs.liberation_ttf}";
    };
  };
}
