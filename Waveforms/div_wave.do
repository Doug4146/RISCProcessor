onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /div_tb/clock
add wave -noupdate -radix hexadecimal /div_tb/clear
add wave -noupdate -radix hexadecimal /div_tb/DUT/BusData
add wave -noupdate -radix hexadecimal /div_tb/PCout
add wave -noupdate -radix hexadecimal /div_tb/MARin
add wave -noupdate -radix hexadecimal /div_tb/IncPC
add wave -noupdate -radix hexadecimal /div_tb/Zin
add wave -noupdate -radix hexadecimal /div_tb/Zlowout
add wave -noupdate -radix hexadecimal /div_tb/PCin
add wave -noupdate -radix hexadecimal /div_tb/Read
add wave -noupdate -radix hexadecimal /div_tb/Mdatain
add wave -noupdate -radix hexadecimal /div_tb/MDRin
add wave -noupdate -radix hexadecimal /div_tb/MDRout
add wave -noupdate -radix hexadecimal /div_tb/IRin
add wave -noupdate -radix hexadecimal /div_tb/R3out
add wave -noupdate -radix hexadecimal /div_tb/Yin
add wave -noupdate -radix hexadecimal /div_tb/R1out
add wave -noupdate -radix hexadecimal /div_tb/DIV
add wave -noupdate -radix hexadecimal /div_tb/LOin
add wave -noupdate -radix hexadecimal /div_tb/Zhighout
add wave -noupdate -radix hexadecimal /div_tb/HIin
add wave -noupdate -radix hexadecimal /div_tb/DUT/R1_val
add wave -noupdate -radix hexadecimal /div_tb/DUT/R3_val
add wave -noupdate -radix hexadecimal /div_tb/DUT/LO_val
add wave -noupdate -radix hexadecimal /div_tb/DUT/HI_val
add wave -noupdate -radix hexadecimal /div_tb/DUT/PC_val
add wave -noupdate -radix hexadecimal /div_tb/DUT/IR_val
add wave -noupdate -radix hexadecimal /div_tb/DUT/Zlow_val
add wave -noupdate -radix hexadecimal /div_tb/DUT/Zhigh_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {534667 ps} 0}
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
WaveRestoreZoom {0 ps} {575210 ps}
