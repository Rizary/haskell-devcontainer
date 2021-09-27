{}:
{
  src = ../..;
  compiler-nix-name = "ghc8107";
  # This is used by `nix develop .` to open a shell for use with
  # `cabal`, `hlint` and `haskell-language-server`
  shell.tools = {
    cabal = {};
    hlint = {};
    haskell-language-server = {};
  };
  # shell.crossPlatform = p: [p.ghcjs];
  # This adds `js-unknown-ghcjs-cabal` to the shell.
}