# This commit corresponds to the nixpkgs-unstable channel at 2018-01-08
let
  pkgs = import (fetchTarball https://github.com/NixOS/nixpkgs/tarball/310ad4345bbe42ae7360981243f6602a03fd232f) {};
  plpdart = (import ./packages/plpdart.nix) {stdenv=pkgs.stdenv;fetchurl=pkgs.fetchurl; unzip=pkgs.unzip;};
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
      docker_compose
      doit
      gcc
      git
      gmp
      nix
      nodejs
      plpdart
      postgresql
      stack
      tup
      yarn
    ];
  };
}
