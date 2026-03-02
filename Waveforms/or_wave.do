onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /or_tb/clock
add wave -noupdate -radix hexadecimal /or_tb/clear
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusData
add wave -noupdate -radix hexadecimal /or_tb/PCout
add wave -noupdate -radix hexadecimal /or_tb/MARin
add wave -noupdate -radix hexadecimal /or_tb/IncPC
add wave -noupdate -radix hexadecimal /or_tb/Zin
add wave -noupdate -radix hexadecimal /or_tb/Zlowout
add wave -noupdate -radix hexadecimal /or_tb/PCin
add wave -noupdate -radix hexadecimal /or_tb/Read
add wave -noupdate -radix hexadecimal /or_tb/Mdatain
add wave -noupdate -radix hexadecimal /or_tb/MDRin
add wave -noupdate -radix hexadecimal /or_tb/MDRout
add wave -noupdate -radix hexadecimal /or_tb/IRin
add wave -noupdate -radix hexadecimal /or_tb/R5out
add wave -noupdate -radix hexadecimal /or_tb/Yin
add wave -noupdate -radix hexadecimal /or_tb/R6out
add wave -noupdate -radix hexadecimal /or_tb/OR
add wave -noupdate -radix hexadecimal /or_tb/R2in
add wave -noupdate -radix hexadecimal /or_tb/DUT/R2_val
add wave -noupdate -radix hexadecimal /or_tb/DUT/R5_val
add wave -noupdate -radix hexadecimal /or_tb/DUT/R6_val
add wave -noupdate -radix hexadecimal /or_tb/DUT/Zlow_val
add wave -noupdate -radix hexadecimal /or_tb/DUT/PC_val
add wave -noupdate -radix hexadecimal /or_tb/DUT/IR_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {226564 ps} 0}
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
WaveRestoreZoom {0 ps} {300760 ps}
