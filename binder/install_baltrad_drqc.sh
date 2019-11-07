#!/usr/bin/env bash
set -x

# Vagrant provision script for installing BALTRAD wrwp from source
export CONDA_PREFIX=/srv/conda/envs/notebook
export RAVEROOT=$CONDA_PREFIX

# Install system dependencies, not conda in this case
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$CONDA_PREFIX/hlhdf/lib:$CONDA_PREFIX/rave/lib

cd ~
if [ ! -d tmp ]; then
    mkdir tmp
fi
cd tmp
git clone --depth 1 https://github.com/DanielMichelson/drqc_py3.git
cd drqc_py3/

make
make test
make install
cd ~
