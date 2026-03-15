onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /mul_tb/clock
add wave -noupdate -radix hexadecimal /mul_tb/clear
add wave -noupdate -radix hexadecimal /mul_tb/DUT/BusData
add wave -noupdate -radix hexadecimal /mul_tb/PCout
add wave -noupdate -radix hexadecimal /mul_tb/MARin
add wave -noupdate -radix hexadecimal /mul_tb/IncPC
add wave -noupdate -radix hexadecimal /mul_tb/Zin
add wave -noupdate -radix hexadecimal /mul_tb/Zlowout
add wave -noupdate -radix hexadecimal /mul_tb/PCin
add wave -noupdate -radix hexadecimal /mul_tb/Read
add wave -noupdate -radix hexadecimal /mul_tb/Mdatain
add wave -noupdate -radix hexadecimal /mul_tb/MDRin
add wave -noupdate -radix hexadecimal /mul_tb/MDRout
add wave -noupdate -radix hexadecimal /mul_tb/IRin
add wave -noupdate -radix hexadecimal /mul_tb/R3out
add wave -noupdate -radix hexadecimal /mul_tb/Yin
add wave -noupdate -radix hexadecimal /mul_tb/MUL_start
add wave -noupdate -radix hexadecimal /mul_tb/R1out
add wave -noupdate -radix hexadecimal /mul_tb/MUL
add wave -noupdate -radix hexadecimal /mul_tb/LOin
add wave -noupdate -radix hexadecimal /mul_tb/Zhighout
add wave -noupdate -radix hexadecimal /mul_tb/HIin
add wave -noupdate -radix hexadecimal /mul_tb/MUL_busy
add wave -noupdate -radix hexadecimal /mul_tb/Present_state
add wave -noupdate -radix hexadecimal /mul_tb/DUT/R1_val
add wave -noupdate -radix hexadecimal /mul_tb/DUT/R3_val
add wave -noupdate -radix hexadecimal /mul_tb/DUT/LO_val
add wave -noupdate -radix hexadecimal /mul_tb/DUT/HI_val
add wave -noupdate -radix hexadecimal /mul_tb/DUT/Zlow_val
add wave -noupdate -radix hexadecimal /mul_tb/DUT/Zhigh_val
add wave -noupdate -radix hexadecimal /mul_tb/DUT/PC_val
add wave -noupdate -radix hexadecimal /mul_tb/DUT/IR_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {619563 ps} 0}
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
WaveRestoreZoom {0 ps} {648114 ps}
