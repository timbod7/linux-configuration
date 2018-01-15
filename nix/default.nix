let
  pkgs = import <nixos1709> {};
  terraform = (import ./packages/terraform.nix) {
    inherit (pkgs) stdenv lib buildEnv buildGoPackage fetchpatch fetchFromGitHub makeWrapper;
  };
  bazel_0_8_1 = (import ./packages/bazel.nix) {
    inherit (pkgs) stdenv lib fetchurl jdk zip unzip bash writeScriptBin coreutils makeWrapper which python;
  };
in with pkgs; {
  simpleEnv = stdenv.mkDerivation {
    name = "simple-env";
    version = "1";
    buildInputs = [
      arcanist
      awscli
      bazel_0_8_1
      binutils
      docker
      doit
      gcc
      git
      gmp
      kakoune
      htop
      jsonnet
      kubernetes
      nix
      nodejs
      pkgconfig
      postgresql
      stack
      terraform.terraform_0_9_2
      yarn
    ];
  };
}
