onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /jal_tb/clock
add wave -noupdate -radix hexadecimal /jal_tb/clear
add wave -noupdate -radix hexadecimal /jal_tb/Present_state
add wave -noupdate -radix hexadecimal /jal_tb/PCout
add wave -noupdate -radix hexadecimal /jal_tb/MARin
add wave -noupdate -radix hexadecimal /jal_tb/Zin
add wave -noupdate -radix hexadecimal /jal_tb/Zlowout
add wave -noupdate -radix hexadecimal /jal_tb/PCin
add wave -noupdate -radix hexadecimal /jal_tb/MDRin
add wave -noupdate -radix hexadecimal /jal_tb/Read
add wave -noupdate -radix hexadecimal /jal_tb/MDRout
add wave -noupdate -radix hexadecimal /jal_tb/IRin
add wave -noupdate -radix hexadecimal /jal_tb/Yin
add wave -noupdate -radix hexadecimal /jal_tb/ADD
add wave -noupdate -radix hexadecimal /jal_tb/Cout
add wave -noupdate -radix hexadecimal /jal_tb/Grb
add wave -noupdate -radix hexadecimal /jal_tb/Rin
add wave -noupdate -radix hexadecimal /jal_tb/Gra
add wave -noupdate -radix hexadecimal /jal_tb/Rout
add wave -noupdate -radix hexadecimal /jal_tb/DUT/BusData
add wave -noupdate -radix hexadecimal /jal_tb/DUT/R4_val
add wave -noupdate -radix hexadecimal /jal_tb/DUT/R12_val
add wave -noupdate -radix hexadecimal /jal_tb/DUT/PC_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {363907 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {525 ns}
