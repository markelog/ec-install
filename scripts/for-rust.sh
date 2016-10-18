#!/bin/sh

# How one could do this in rust?
cargo_bin=$1
ec=$2
ec_proxy=$3

sleep 2 && mv $ec $cargo_bin && mv $ec_proxy $cargo_bin
