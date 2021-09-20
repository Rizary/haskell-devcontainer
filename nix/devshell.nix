{ pkgs }:

pkgs.devshell.mkShell {
  name = "rizary-haskell";
  motd = ''
    Welcome to rizary-haskell development environment

    If you see this message, it means your are inside the Nix shell.
  '';

  # List of packages that we want to be available inside our Nix shell
  packages = [
    # build tools
    ## Rust
    # pkgs.rust-pl.nix.rustOverlay

    # pkgs.rust-analyzer
    
    ## Haskell
    pkgs.myApp.haskellPackages.ghc884.cabal-install
    # pkgs.myApp.haskellPackages.ghc884.haskell-language-server
    pkgs.myApp.haskellPackages.ghc884.ghc
    pkgs.myApp.haskellPackages.ghc884.ghcide
    pkgs.myApp.haskellPackages.ghc884.ormolu
    pkgs.myApp.haskellPackages.ghc884.hlint
    pkgs.myApp.haskellPackages.ghc884.stylish-haskell
    pkgs.myApp.haskellPackages.ghc884.splice
    pkgs.myApp.haskellPackages.ghc884.retrie
    # pkgs.myApp.haskellPackages.ghc884.haddock
    pkgs.myApp.haskellPackages.ghc884.hiedb
    pkgs.myApp.haskellPackages.ghc884.hls-hlint-plugin
    pkgs.myApp.haskellPackages.ghc884.hls-ormolu-plugin
    pkgs.myApp.haskellPackages.ghc884.hls-stylish-haskell-plugin
    pkgs.myApp.haskellPackages.ghc884.hls-eval-plugin
    pkgs.myApp.haskellPackages.ghc884.hls-class-plugin
    pkgs.myApp.haskellPackages.ghc884.hls-graph
    pkgs.myApp.haskellPackages.ghc884.hls-module-name-plugin
    pkgs.myApp.haskellPackages.ghc884.hls-haddock-comments-plugin
    pkgs.myApp.haskellPackages.ghc884.hls-plugin-api
    pkgs.myApp.haskellPackages.ghc884.hls-pragmas-plugin
    pkgs.myApp.haskellPackages.ghc884.hls-refine-imports-plugin
    pkgs.myApp.haskellPackages.ghc884.hls-retrie-plugin
    pkgs.myApp.haskellPackages.ghc884.hls-splice-plugin
    pkgs.myApp.haskellPackages.ghc884.hls-tactics-plugin
    pkgs.myApp.haskellPackages.ghc884.hls-test-utils

    # Nix code formatter
    pkgs.binutils
    pkgs.pkgconfig
    pkgs.gcc
    pkgs.glibc
    pkgs.nixpkgs-fmt
    pkgs.lldb
  ];
}
