{
  stdenv,
  writeText,
  fetchurl,
  mustacheSpecVersion ? null,
  mustacheSpecSrc ? null
}:

stdenv.mkDerivation rec {
  name = "mustache-spec-${version}";
  version = if (!isNull mustacheSpecVersion) then mustacheSpecVersion else "1.1.2";
  src = if (!isNull mustacheSpecSrc) then mustacheSpecSrc else fetchurl {
    url = https://github.com/mustache/spec/archive/v1.1.2.tar.gz;
    sha256 = "477552869cf4a8d3cadb74f0d297988dfa9edddbc818ee8f56bae0a097dc657c";
  };

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

