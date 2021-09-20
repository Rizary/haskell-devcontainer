{
  description = "myApp";
  # To update all inputs:
  # $ nix flake update --recreate-lock-file
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/master";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.devshell.url = "github:numtide/devshell/master";

  # Haskell dependencies
  inputs.haskell-language-server.url = "github:haskell/haskell-language-server";
  # Rust dependencies
  inputs.naersk.url = "github:nmattia/naersk";
  inputs.naersk.inputs.nixpkgs.follows = "nixpkgs";
  inputs.rust-overlay.url = "github:oxalica/rust-overlay";

  outputs = { self, nixpkgs, haskell-language-server, naersk, flake-utils, devshell, rust-overlay }:
    {
      overlay = import ./nix/overlay.nix;
    } //
    (
      flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            # Makes the config pure as well. See <nixpkgs>/top-level/impure.nix:
            config = {
              allowBroken = true;
              permittedInsecurePackages = [
                "openssl-1.0.2u"
              ];
            };
            overlays = [
              haskell-language-server.overlay
              rust-overlay.overlay
              devshell.overlay
              naersk.overlay
              self.overlay
            ];
          };
        in
        {
          legacyPackages = pkgs.myApp;

          packages = flake-utils.lib.flattenTree pkgs.myApp;

          devShell = import ./nix/devshell.nix { inherit pkgs haskell-language-server; };

          checks = { };
        }
      )
    );
}
