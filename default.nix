{
  pkgs ? import <nixpkgs> {},
  mustacheSpecVersion ? null,
  mustacheSpecSrc ? null,
  mustacheSpecSha256 ? null
}:

pkgs.callPackage ./derivation.nix {
  inherit mustacheSpecVersion mustacheSpecSrc mustacheSpecSha256;
}

