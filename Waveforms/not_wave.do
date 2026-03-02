onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /not_tb/clock
add wave -noupdate -radix hexadecimal /not_tb/clear
add wave -noupdate -radix hexadecimal /not_tb/DUT/BusData
add wave -noupdate -radix hexadecimal /not_tb/PCout
add wave -noupdate -radix hexadecimal /not_tb/MARin
add wave -noupdate -radix hexadecimal /not_tb/IncPC
add wave -noupdate -radix hexadecimal /not_tb/Zin
add wave -noupdate -radix hexadecimal /not_tb/Zlowout
add wave -noupdate -radix hexadecimal /not_tb/PCin
add wave -noupdate -radix hexadecimal /not_tb/Read
add wave -noupdate -radix hexadecimal /not_tb/Mdatain
add wave -noupdate -radix hexadecimal /not_tb/MDRout
add wave -noupdate -radix hexadecimal /not_tb/MDRin
add wave -noupdate -radix hexadecimal /not_tb/IRin
add wave -noupdate -radix hexadecimal /not_tb/R7out
add wave -noupdate -radix hexadecimal /not_tb/NOT
add wave -noupdate -radix hexadecimal /not_tb/R4in
add wave -noupdate -radix hexadecimal /not_tb/DUT/R4_val
add wave -noupdate -radix hexadecimal /not_tb/DUT/R7_val
add wave -noupdate -radix hexadecimal /not_tb/DUT/Zlow_val
add wave -noupdate -radix hexadecimal /not_tb/DUT/PC_val
add wave -noupdate -radix hexadecimal /not_tb/DUT/IR_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {529346 ps} 0}
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
WaveRestoreZoom {0 ps} {583308 ps}
