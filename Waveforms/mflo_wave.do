onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /mflo_tb/clock
add wave -noupdate -radix hexadecimal /mflo_tb/clear
add wave -noupdate -radix hexadecimal /mflo_tb/Present_state
add wave -noupdate -radix hexadecimal /mflo_tb/PCout
add wave -noupdate -radix hexadecimal /mflo_tb/MARin
add wave -noupdate -radix hexadecimal /mflo_tb/Zin
add wave -noupdate -radix hexadecimal /mflo_tb/Zlowout
add wave -noupdate -radix hexadecimal /mflo_tb/PCin
add wave -noupdate -radix hexadecimal /mflo_tb/MDRin
add wave -noupdate -radix hexadecimal /mflo_tb/Read
add wave -noupdate -radix hexadecimal /mflo_tb/MDRout
add wave -noupdate -radix hexadecimal /mflo_tb/IRin
add wave -noupdate -radix hexadecimal /mflo_tb/Gra
add wave -noupdate -radix hexadecimal /mflo_tb/Rin
add wave -noupdate -radix hexadecimal /mflo_tb/LOout
add wave -noupdate -radix hexadecimal /mflo_tb/DUT/BusData
add wave -noupdate -radix hexadecimal /mflo_tb/DUT/R1_val
add wave -noupdate -radix hexadecimal /mflo_tb/DUT/LO_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {272930 ps} 0}
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
