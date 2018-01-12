{ stdenv, fetchurl, unzip }:

let
  version = "1.23.0";
in
stdenv.mkDerivation {
  name = "dart-${version}";

  nativeBuildInputs = [
    unzip
  ];

  src =
    if stdenv.system == "x86_64-linux" then
      fetchurl {
        url = "https://storage.googleapis.com/dart-archive/channels/stable/release/${version}/sdk/dartsdk-linux-x64-release.zip";
        sha256 = "f57b4bdf64961963cf82362bf3834b058aa1db838a0c4543689c73e304718563";
      }
    else
      fetchurl {
        url = "https://storage.googleapis.com/dart-archive/channels/stable/release/${version}/sdk/dartsdk-linux-ia32-release.zip";
        sha256 = "2add504a7b4b8de2dad151e86894c17f04abb31eaa2fb475cf00d4ad1281a6e6";
      };

  installPhase = ''
    mkdir -p $out
    cp -R * $out/
    echo $libPath
    patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
             --set-rpath $libPath \
             $out/bin/dart
  '';

  libPath = stdenv.lib.makeLibraryPath [ stdenv.cc.cc ];

  dontStrip = true;

  meta = {
    platforms = [ "i686-linux" "x86_64-linux" ];
    homepage = https://www.dartlang.org/;
    description = "Scalable programming language, with robust libraries and runtimes, for building web, server, and mobile apps";
    longDescription = ''
      Dart is a class-based, single inheritance, object-oriented language
      with C-style syntax. It offers compilation to JavaScript, interfaces,
      mixins, abstract classes, reified generics, and optional typing.
    '';
    license = stdenv.lib.licenses.bsd3;
  };
}