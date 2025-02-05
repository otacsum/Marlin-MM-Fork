; Setup
G90 ; use absolute coordinates
M83 ; extruder relative mode
M204 S[machine_max_acceleration_extruding] T[machine_max_acceleration_retracting]
M104 S[first_layer_temperature] ; set extruder temp
M140 S[first_layer_bed_temperature] ; set bed temp
G28 ; home all
G1 Z20 F300 ; move nozzle up 20mm
G1 X-6 F1800 ; move nozzle off bed
M106 S75 ; turn fan up to 30%
M190 S[first_layer_bed_temperature] ; wait for bed temp
M109 S[first_layer_temperature] ; wait for extruder temp
G4 P250 ; Wait .25 seconds
G92 E0.0

; Cleaning Nozzle.
G1 Z4 F300 ; Move above brush height
G1 X264 F15000 ; Rapid to starting position
; First brush edges
G1 Z0.7 F300 ; Move down into brush
G1 Y33 F1800 ; Brush Forward
G1 X256 F1800; Move over slightly
G1 Y0 F1800 ; Brush backward
; Then brush the chamfers
G1 Z2 F300 ; Move up slightly
G1 X261 F15000 ; Move to cleaning brush
G1 Y33 F1800 ; Brush forward
G1 X258 F1800 ; Move over slightly
G1 Y0 F1800 ; Brush backward
; finally brush the tip then move off the brush
G1 Z3 F300 ; Move up slightly
G1 X257 F1800 ; Move over slightly
G1 Y33 F1800 ; Move forward
G1 X260 F1800 ; Move over slightly
G1 Y0 F1800 ; Move backward
G1 X250 F15000 ; Move off the brush.

; Priming Nozzle
G1 X249.5 Y50 F15000 ; Move to priming area
G1 Z0.25 F300 ; Move to layer height
G1 Y220  E17.4828 F1800 ; print priming line 1
G1 X248.75 F1800 ; move nozzle
G1 Y50  E17.4828 F1800 ; print priming line 2

; Printing
G92 E0.0
