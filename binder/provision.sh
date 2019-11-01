#!/usr/bin/env bash

cd ~
mkdir data
cd data

#cp2 removed for this example

#mkdir cp2
#cd cp2
#wget http://mcs.anl.gov/~scollis/cp2.tgz
#tar -xvzf cp2.tgz
#rm cp2.tgz
#cd ..

mkdir arm
cd arm
wget http://www.mcs.anl.gov/~scollis/pyart/csapr_test_case.nc
wget http://www.mcs.anl.gov/~scollis/pyart/nsaxsaprppiC1.a1.20140201.184802.nc
wget http://www.mcs.anl.gov/~scollis/pyart/sgpxsaprcmacsurI5.c1.20170801.044013.nc
cd ..
cd ~