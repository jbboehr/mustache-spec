{
  pkgs ? import <nixpkgs> {},
  mustacheSpecVersion ? "1.1.2",
  mustacheSpecSrc ? null
}:

pkgs.callPackage ./derivation.nix {
  inherit mustacheSpecVersion mustacheSpecSrc;
}

