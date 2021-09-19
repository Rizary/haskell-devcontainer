{
  description = "myApp";
  # To update all inputs:
  # $ nix flake update --recreate-lock-file
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/master";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.devshell.url = "github:numtide/devshell/master";

  # Rust dependencies
  inputs.naersk.url = "github:nmattia/naersk";
  inputs.naersk.inputs.nixpkgs.follows = "nixpkgs";
  inputs.rust-overlay.url = "github:oxalica/rust-overlay";

  outputs = { self, nixpkgs, naersk, flake-utils, devshell, rust-overlay }:
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

          devShell = import ./nix/devshell.nix { inherit pkgs; };

          checks = { };
        }
      )
    );
}
