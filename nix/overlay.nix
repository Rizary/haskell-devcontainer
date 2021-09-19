final: prev:
let
  noCheck = p: final.haskell.lib.dontCheck p;
  noHaddock = p: final.haskell.lib.dontHaddock p;
  fast = p: noHaddock (noCheck p);
  ghcVer = "ghc884";
in {
  myApp = rec {
    haskellPkg = prev.haskell.packages.${ghcVer}.extend (self: super: {
        # hls-call-hierarchy-plugin = self.callHackage "hls-call-hierarchy-plugin" "1.0.0.0" { };
    });
    nix = prev.callPackage ./. { };
    haskellPackages = prev.haskell.packages // {
      ghc884 = haskellPkg;
    };
  };
}