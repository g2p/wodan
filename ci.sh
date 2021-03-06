#!/bin/bash
# Just a sketch
# Useful for testing things without waiting on Travis,
# but only slightly faster
# Using rootless podman, should work similarly with docker
# See doc/CI-NOTES.
#podman build -v ~/.opam/download-cache:/home/opam/.opam/download-cache -v $PWD:/repo --tag local-build .
buildah bud -v ~/.opam/download-cache:/home/opam/.opam/download-cache -v $PWD:/repo --tag local-build .
podman run -it --userns=keep-id -v ~/.opam/download-cache:/home/opam/.opam/download-cache -v .:/repo -e PACKAGE=wodan-irmin local-build ci-opam
