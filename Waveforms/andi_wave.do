onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /andi_tb/clock
add wave -noupdate -radix hexadecimal /andi_tb/clear
add wave -noupdate -radix hexadecimal /andi_tb/Present_state
add wave -noupdate -radix hexadecimal /andi_tb/Grb
add wave -noupdate -radix hexadecimal /andi_tb/Rin
add wave -noupdate -radix hexadecimal /andi_tb/InPortout
add wave -noupdate -radix hexadecimal /andi_tb/IRin
add wave -noupdate -radix hexadecimal /andi_tb/PCout
add wave -noupdate -radix hexadecimal /andi_tb/MARin
add wave -noupdate -radix hexadecimal /andi_tb/Zin
add wave -noupdate -radix hexadecimal /andi_tb/Zlowout
add wave -noupdate -radix hexadecimal /andi_tb/PCin
add wave -noupdate -radix hexadecimal /andi_tb/MDRin
add wave -noupdate -radix hexadecimal /andi_tb/Read
add wave -noupdate -radix hexadecimal /andi_tb/MDRout
add wave -noupdate -radix hexadecimal /andi_tb/Rout
add wave -noupdate -radix hexadecimal /andi_tb/Yin
add wave -noupdate -radix hexadecimal /andi_tb/Cout
add wave -noupdate -radix hexadecimal /andi_tb/AND
add wave -noupdate -radix hexadecimal /andi_tb/Gra
add wave -noupdate -radix binary /andi_tb/DUT/BusData
add wave -noupdate -radix binary /andi_tb/DUT/R4_val
add wave -noupdate -radix binary /andi_tb/DUT/R7_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {40450 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 218
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {97530 ps}
