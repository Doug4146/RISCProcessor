onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /ori_tb/clock
add wave -noupdate -radix hexadecimal /ori_tb/clear
add wave -noupdate -radix hexadecimal /ori_tb/Present_state
add wave -noupdate -radix hexadecimal /ori_tb/PCout
add wave -noupdate -radix hexadecimal /ori_tb/MARin
add wave -noupdate -radix hexadecimal /ori_tb/Zin
add wave -noupdate -radix hexadecimal /ori_tb/Read
add wave -noupdate -radix hexadecimal /ori_tb/MDRin
add wave -noupdate -radix hexadecimal /ori_tb/PCin
add wave -noupdate -radix hexadecimal /ori_tb/Zlowout
add wave -noupdate -radix hexadecimal /ori_tb/MDRout
add wave -noupdate -radix hexadecimal /ori_tb/IRin
add wave -noupdate -radix hexadecimal /ori_tb/Yin
add wave -noupdate -radix hexadecimal /ori_tb/Grb
add wave -noupdate -radix hexadecimal /ori_tb/Rout
add wave -noupdate -radix hexadecimal /ori_tb/Cout
add wave -noupdate -radix hexadecimal /ori_tb/OR
add wave -noupdate -radix binary /ori_tb/Gra
add wave -noupdate -radix hexadecimal /ori_tb/Grc
add wave -noupdate -radix hexadecimal /ori_tb/Rin
add wave -noupdate -radix hexadecimal /ori_tb/Zhighout
add wave -noupdate -radix binary /ori_tb/DUT/BusData
add wave -noupdate -radix binary /ori_tb/DUT/R4_val
add wave -noupdate -radix binary /ori_tb/DUT/R7_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {322139 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 94
configure wave -valuecolwidth 265
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
WaveRestoreZoom {0 ps} {430100 ps}
