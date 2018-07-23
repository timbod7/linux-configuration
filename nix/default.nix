let
  pkgs = import <nixos1803> {};
  terraform = (import ./packages/terraform.nix) {
    inherit (pkgs) stdenv lib buildEnv buildGoPackage fetchpatch fetchFromGitHub makeWrapper;
  };
  bazel_0_11_1 = (import ./packages/bazel.nix) {
    inherit (pkgs) stdenv lib fetchurl jdk zip unzip bash writeScriptBin coreutils makeWrapper which python;
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
      git-lfs
      gmp
      gradle
      kakoune
      htop
      jsonnet
      kubernetes
      nix
      glibcLocales
      nodejs-8_x
      pkgconfig
      postgresql
      stack
      terraform.terraform_0_9_2
      yarn
    ];
  };
}
