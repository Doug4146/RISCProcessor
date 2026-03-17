onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /mfhi_tb/clock
add wave -noupdate -radix hexadecimal /mfhi_tb/clear
add wave -noupdate -radix hexadecimal /mfhi_tb/Present_state
add wave -noupdate -radix hexadecimal /mfhi_tb/MARin
add wave -noupdate -radix hexadecimal /mfhi_tb/Zin
add wave -noupdate -radix hexadecimal /mfhi_tb/PCout
add wave -noupdate -radix hexadecimal /mfhi_tb/Zlowout
add wave -noupdate -radix hexadecimal /mfhi_tb/PCin
add wave -noupdate -radix hexadecimal /mfhi_tb/MDRin
add wave -noupdate -radix hexadecimal /mfhi_tb/Read
add wave -noupdate -radix hexadecimal /mfhi_tb/MDRout
add wave -noupdate -radix hexadecimal /mfhi_tb/IRin
add wave -noupdate -radix hexadecimal /mfhi_tb/Gra
add wave -noupdate -radix hexadecimal /mfhi_tb/Rin
add wave -noupdate -radix hexadecimal /mfhi_tb/HIout
add wave -noupdate -radix hexadecimal /mfhi_tb/DUT/BusData
add wave -noupdate -radix hexadecimal /mfhi_tb/DUT/HI_val
add wave -noupdate -radix hexadecimal /mfhi_tb/DUT/R5_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {380132 ps} 0}
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
