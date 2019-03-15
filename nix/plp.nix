# This commit corresponds to the nixpkgs-unstable channel at 2018-01-08
let
  pkgs = import <nixos1803> {};
  dart_1_23 = (import ./packages/dart_1_23.nix) {
    inherit (pkgs) stdenv fetchurl unzip;
  };
  bazel_0_11_1 = (import ./packages/bazel.nix) {
    inherit (pkgs) stdenv lib fetchurl jdk zip unzip bash writeScriptBin coreutils makeWrapper which python;
  };
  doit = (import ./packages/doit.nix) {
    inherit (pkgs) stdenv fetchurl python3Packages;
  };
in with pkgs; {
  simpleEnv = stdenv.mkDerivation {
    name = "simple-env";
    version = "1";
    buildInputs = [
      arcanist
      awscli
      bazel_0_11_1
      binutils
      docker
      docker_compose
      doit
      gcc
      git
      gmp
      nix
      nodejs
      dart_1_23
      sass
      postgresql
      stack
      tup
      yarn
    ];
  };
}
