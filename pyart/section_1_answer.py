radar = pyart.io.read('./data/nsaxsaprppiC1.a1.20140201.184802.nc')
display = pyart.graph.RadarMapDisplay(radar)
display.plot_ppi_map('reflectivity_horizontal', sweep=0, vmin=-10, vmax=60,
                     resolution='10m')
