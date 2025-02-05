G92 E0.0
G1{if max_layer_z < max_print_height} Z{z_offset+min(max_layer_z+2, max_print_height)}{endif} E-2.0 F720 ; move print head up & retract filament
G4 ; wait
M104 S0 ; turn off extruder
M140 S0 ; turn off heatbed
G1 X-6 Y0 F15000 ; Park extruder
M106 S75 ; Turn fan down to 30%
M84 ; Disable motors
G4 P30000 ; Wait 30 seconds to let the fan duct cool
M107 ; Turn the fan off
