let
  pkgs = import <nixos1803> {};
  terraform = (import ./packages/terraform.nix) {
    inherit (pkgs) stdenv lib buildEnv buildGoPackage fetchpatch fetchFromGitHub makeWrapper;
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
      git-lfs
      glibcLocales
      gmp
      gradle
      htop
      jsonnet
      jq
      kakoune
      kubernetes
      kubernetes-helm
      nix
      nodejs-8_x
      pkgconfig
      postgresql
      pandoc
      rustup
      stack
      terraform.terraform_0_9_2
      tup
      tmux
      yarn
    ];
  };
}
