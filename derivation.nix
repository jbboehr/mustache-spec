{
  lib,
  stdenv,
  writeText,
  fetchurl,
  mustacheSpecVersion ? null,
  mustacheSpecSrc ? null,
  mustacheSpecSha256 ? null
}:

let 
  orDefault = x: y: (if (!isNull x) then x else y);
in

stdenv.mkDerivation rec {
  name = "mustache-spec-${version}";
  version = orDefault mustacheSpecVersion "v1.1.2";
  src = orDefault mustacheSpecSrc (fetchurl {
    url = "https://github.com/mustache/spec/archive/${version}.tar.gz";
    sha256 = orDefault mustacheSpecSha256 "477552869cf4a8d3cadb74f0d297988dfa9edddbc818ee8f56bae0a097dc657c";
  });

  builder = writeText "builder.sh" ''
      source $stdenv/setup
      
      buildPhase() {
          echo do nothing
      }
      
      installPhase() {
          mkdir -p $out/share/mustache-spec
          cp -prvd specs $out/share/mustache-spec/
      }
      
      genericBuild
    '';

  meta = {
    description = "The mustache spec";
    homepage = https://github.com/mustache/spec;
    maintainers = [  ];
  };
}

