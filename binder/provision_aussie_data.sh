#!/usr/bin/env bash

cd ~
cd data

#TerryHills(DP)
wget -O th.zip http://dapds00.nci.org.au/thredds/fileServer/rq0/odim_pvol/71/2018/vol/71_20181220.pvol.zip
unzip th.zip
mkdir terryhills
mv *.pvol.h5 terryhills

#Wollongong(SP)
wget -O wg.zip http://dapds00.nci.org.au/thredds/fileServer/rq0/odim_pvol/03/2018/vol/03_20181220.pvol.zip
unzip wg.zip
mkdir wollongong
mv *.pvol.h5 wollongong

#Newcastle(SP)
wget -O nc.zip http://dapds00.nci.org.au/thredds/fileServer/rq0/odim_pvol/04/2018/vol/04_20181220.pvol.zip
unzip nc.zip
mkdir newcastle
mv *.pvol.h5 newcastle

#Canberra(SP)
wget -O cb.zip http://dapds00.nci.org.au/thredds/fileServer/rq0/odim_pvol/40/2018/vol/40_20181220.pvol.zip
unzip cb.zip
unzip cb.zip
mkdir canberra
mv *.pvol.h5 canberra


