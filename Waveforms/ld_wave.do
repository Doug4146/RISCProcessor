onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /ld_tb/clock
add wave -noupdate -radix hexadecimal /ld_tb/clear
add wave -noupdate -radix hexadecimal /ld_tb/Present_state
add wave -noupdate -radix hexadecimal /ld_tb/InPortout
add wave -noupdate -radix hexadecimal /ld_tb/IRin
add wave -noupdate -radix hexadecimal /ld_tb/Grb
add wave -noupdate -radix hexadecimal /ld_tb/Rin
add wave -noupdate -radix hexadecimal /ld_tb/PCout
add wave -noupdate -radix hexadecimal /ld_tb/MARin
add wave -noupdate -radix hexadecimal /ld_tb/Zin
add wave -noupdate -radix hexadecimal /ld_tb/Zlowout
add wave -noupdate -radix hexadecimal /ld_tb/PCin
add wave -noupdate -radix hexadecimal /ld_tb/MDRin
add wave -noupdate -radix hexadecimal /ld_tb/Read
add wave -noupdate -radix hexadecimal /ld_tb/MDRout
add wave -noupdate -radix hexadecimal /ld_tb/BAout
add wave -noupdate -radix hexadecimal /ld_tb/Yin
add wave -noupdate -radix hexadecimal /ld_tb/Cout
add wave -noupdate -radix hexadecimal /ld_tb/ADD
add wave -noupdate -radix hexadecimal /ld_tb/Gra
add wave -noupdate -radix hexadecimal /ld_tb/input_unit
add wave -noupdate -radix hexadecimal /ld_tb/MUL_busy
add wave -noupdate -radix hexadecimal /ld_tb/MARout
add wave -noupdate -radix hexadecimal /ld_tb/DUT/BusData
add wave -noupdate -radix hexadecimal /ld_tb/DUT/R0_val
add wave -noupdate -radix hexadecimal /ld_tb/DUT/R2_val
add wave -noupdate -radix hexadecimal /ld_tb/DUT/R7_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {504569 ps} 0}
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
