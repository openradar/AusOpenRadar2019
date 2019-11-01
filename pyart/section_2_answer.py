ncp_field = radar.fields['normalized_coherent_power']['data']
ncp_gt_0 = np.ma.where(ncp_field > 0, 1, 0)
mask_dict = {'data': ref_gt_0, 'units': '0 = NCP < 0.5, 1 = NCP >= 0.5',
             'long_name': 'normalied_coherent_power_mask',
             '_FillValue': ref_gt_0.fill_value, 'standard_name': 'ncp_mask'}
radar.add_field('ncp_mask', mask_dict, replace_existing=True)
display = pyart.graph.RadarMapDisplay(radar)
display.plot_ppi_map('ncp_mask', cmap='coolwarm', vmin=0, vmax=1)
