onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /out_tb/clock
add wave -noupdate -radix hexadecimal /out_tb/clear
add wave -noupdate -radix hexadecimal /out_tb/Present_state
add wave -noupdate -radix hexadecimal /out_tb/Gra
add wave -noupdate -radix hexadecimal /out_tb/Rout
add wave -noupdate -radix hexadecimal /out_tb/OutPort_in
add wave -noupdate -radix hexadecimal /out_tb/port_display
add wave -noupdate -radix hexadecimal /out_tb/Rin
add wave -noupdate -radix hexadecimal /out_tb/InPortout
add wave -noupdate -radix hexadecimal /out_tb/IRin
add wave -noupdate -radix hexadecimal /out_tb/PCout
add wave -noupdate -radix hexadecimal /out_tb/MARin
add wave -noupdate -radix hexadecimal /out_tb/Zin
add wave -noupdate -radix hexadecimal /out_tb/Read
add wave -noupdate -radix hexadecimal /out_tb/PCin
add wave -noupdate -radix hexadecimal /out_tb/MDRin
add wave -noupdate -radix hexadecimal /out_tb/MDRout
add wave -noupdate -radix hexadecimal /out_tb/MARout
add wave -noupdate -radix hexadecimal /out_tb/input_unit
add wave -noupdate -radix hexadecimal /out_tb/DUT/R7_val
add wave -noupdate -radix hexadecimal /out_tb/DUT/BusData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {120530 ps} 0}
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
