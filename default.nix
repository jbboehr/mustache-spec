{
  pkgs ? import <nixpkgs> {},
  mustacheSpecVersion ? null,
  mustacheSpecSrc ? ./.,
  mustacheSpecSha256 ? null
}:

pkgs.callPackage ./derivation.nix {
  inherit mustacheSpecVersion mustacheSpecSrc mustacheSpecSha256;
}

