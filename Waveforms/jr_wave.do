onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /jr_tb/clock
add wave -noupdate -radix hexadecimal /jr_tb/clear
add wave -noupdate -radix hexadecimal /jr_tb/Present_state
add wave -noupdate -radix hexadecimal /jr_tb/InPortout
add wave -noupdate -radix hexadecimal /jr_tb/IRin
add wave -noupdate -radix hexadecimal /jr_tb/Gra
add wave -noupdate -radix hexadecimal /jr_tb/Rin
add wave -noupdate -radix hexadecimal /jr_tb/PCin
add wave -noupdate -radix hexadecimal /jr_tb/MARin
add wave -noupdate -radix hexadecimal /jr_tb/Zin
add wave -noupdate -radix hexadecimal /jr_tb/PCout
add wave -noupdate -radix hexadecimal /jr_tb/Zlowout
add wave -noupdate -radix hexadecimal /jr_tb/MDRin
add wave -noupdate -radix hexadecimal /jr_tb/Read
add wave -noupdate -radix hexadecimal /jr_tb/MDRout
add wave -noupdate -radix hexadecimal /jr_tb/Rout
add wave -noupdate -radix hexadecimal /jr_tb/CON_val
add wave -noupdate -radix hexadecimal /jr_tb/DUT/BusData
add wave -noupdate -radix hexadecimal /jr_tb/DUT/R12_val
add wave -noupdate -radix hexadecimal /jr_tb/DUT/PC_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {82285 ps} 0}
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
