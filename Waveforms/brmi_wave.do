onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /brmi_tb/clock
add wave -noupdate -radix hexadecimal /brmi_tb/clear
add wave -noupdate -radix hexadecimal /brmi_tb/MARin
add wave -noupdate -radix hexadecimal /brmi_tb/Zin
add wave -noupdate -radix hexadecimal /brmi_tb/PCout
add wave -noupdate -radix hexadecimal /brmi_tb/Zlowout
add wave -noupdate -radix hexadecimal /brmi_tb/PCin
add wave -noupdate -radix hexadecimal /brmi_tb/MDRin
add wave -noupdate -radix hexadecimal /brmi_tb/Read
add wave -noupdate -radix hexadecimal /brmi_tb/MDRout
add wave -noupdate -radix hexadecimal /brmi_tb/IRin
add wave -noupdate -radix hexadecimal /brmi_tb/Gra
add wave -noupdate -radix hexadecimal /brmi_tb/Rout
add wave -noupdate -radix hexadecimal /brmi_tb/CONin
add wave -noupdate -radix hexadecimal /brmi_tb/Yin
add wave -noupdate -radix hexadecimal /brmi_tb/Cout
add wave -noupdate -radix hexadecimal /brmi_tb/ADD
add wave -noupdate -radix hexadecimal /brmi_tb/CON_val
add wave -noupdate -radix hexadecimal /brmi_tb/Present_state
add wave -noupdate -radix hexadecimal /brmi_tb/DUT/BusData
add wave -noupdate -radix hexadecimal /brmi_tb/DUT/R3_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {252070 ps} 0}
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
