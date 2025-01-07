{
  description = "Example Flake for a C project with GCC and ncurses";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
    devShell.${system} = pkgs.mkShell {
      # Provide any build or runtime dependencies here:
      buildInputs = [
        pkgs.gcc14
        pkgs.ncurses6
      ];
    };
  };
}
