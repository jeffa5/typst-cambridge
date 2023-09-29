{
  description = "Cambridge typst materials";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    typstFmt.url = "github:jeffa5/typstfmt";
  };

  outputs = {
    self,
    nixpkgs,
    typstFmt,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [typstFmt.overlays.default];
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        typst
        typstfmt
      ];
      TYPST_FONT_PATHS = "${pkgs.liberation_ttf}";
    };
  };
}
