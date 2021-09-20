{ pkgs, haskell-language-server }:

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
    pkgs.myApp.haskellPackages.ghc8107.cabal-install
    haskell-language-server.packages.x86_64-linux.haskell-language-server-8107
    pkgs.myApp.haskellPackages.ghc8107.ghc

    # Nix code formatter
    pkgs.binutils
    pkgs.pkgconfig
    pkgs.gcc
    pkgs.glibc
    pkgs.nixpkgs-fmt
    pkgs.lldb
  ];
}
