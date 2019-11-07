#!/usr/bin/env bash
set -x

# Vagrant provision script for installing BALTRAD GoogleMapsPlugin component

# dependencies removed in bare-bones provisioning

# install GoogleMapsPlugin from source
cd ~
if [ ! -d tmp ]; then
    mkdir tmp
fi
cd tmp

git clone --depth=1 git://git.baltrad.eu/GoogleMapsPlugin.git
cd GoogleMapsPlugin/

source $CONDA_DIR/bin/activate $RADARENV
export CONDA_PREFIX=/srv/conda/envs/notebook
python setup.py install --prefix=$CONDA_PREFIX

# Replace Google Maps with OpenStreetMap
cp web/index.html $CONDA_PREFIX/rave_gmap/web/.
rm $CONDA_PREFIX/rave_gmap/web/index.php

# The .pth file is not copied because of this, manually create the file
echo $CONDA_PREFIX/rave_gmap/Lib/ > $CONDA_PREFIX/lib/python3.7/site-packages/rave_gmap.pth
