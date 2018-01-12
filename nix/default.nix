# This commit corresponds to the nixpkgs-unstable channel at 2018-01-08
let
  pkgs = import (fetchTarball https://github.com/NixOS/nixpkgs/tarball/310ad4345bbe42ae7360981243f6602a03fd232f) {};
  terraform = (import ./packages/terraform.nix) {
    inherit (pkgs) stdenv lib buildEnv buildGoPackage fetchpatch fetchFromGitHub makeWrapper;
  };
in with pkgs; {
  simpleEnv = stdenv.mkDerivation {
    name = "simple-env";
    version = "1";
    buildInputs = [
      arcanist
      awscli
      bazel
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
