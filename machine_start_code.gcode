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
G1 Z2.5 F300
G91 ; Relative Positioning
; Position: X264 Y0
; Brush left and right repeatedly while moving forward
M808 L18 ; Loop 19 times (36 mm, 0 start)
; Brush left and right, then move forward
G1 X-10 F1800
G1 X10 F1800
G1 Y2 F1800
M808
; Position: X264 Y36
; Brush back and forth repeatedly while moving right
M808 L5 ; Loop 5 times (10 mm)
; Brush backward and forward, then move over
G1 Y-36 F1800
G1 Y36 F1800
G1 X-2 F1800
M808
; Position: X254 Y36
G90 ; Absolute Positioning

G1 Z0.7 F300 ; Lower a little to get the flats of the nozzle
M808 L3 ; Brush the edge 3 times
G1 Y0 F8000
G1 Y36 F8000
M808
G1 X264 F8000 ; Move back left
M808 L3 ; Brush the other edge 3 times
G1 Y0 F8000
G1 Y36 F8000
M808

G1 X250 Y38 F15000 ; Move off the brush.

; Priming Nozzle
M83 ; extruder relative mode
G1 X249.5 Y50 F15000 ; Move to priming area
G1 Z0.25 F300 ; Move to layer height
G1 Y220  E17.4828 F1800 ; print priming line 1
G1 X248.75 F1800 ; move nozzle
G1 Y50  E17.4828 F1800 ; print priming line 2

; Printing
G92 E0.0
