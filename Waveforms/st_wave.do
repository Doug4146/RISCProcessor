onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /st_tb/clock
add wave -noupdate -radix hexadecimal /st_tb/clear
add wave -noupdate -radix hexadecimal /st_tb/Present_state
add wave -noupdate -radix hexadecimal /st_tb/Grb
add wave -noupdate -radix hexadecimal /st_tb/Rin
add wave -noupdate -radix hexadecimal /st_tb/InPortout
add wave -noupdate -radix hexadecimal /st_tb/IRin
add wave -noupdate -radix hexadecimal /st_tb/PCout
add wave -noupdate -radix hexadecimal /st_tb/MARin
add wave -noupdate -radix hexadecimal /st_tb/Zin
add wave -noupdate -radix hexadecimal /st_tb/Zlowout
add wave -noupdate -radix hexadecimal /st_tb/PCin
add wave -noupdate -radix hexadecimal /st_tb/MDRin
add wave -noupdate -radix hexadecimal /st_tb/Read
add wave -noupdate -radix hexadecimal /st_tb/MDRout
add wave -noupdate -radix hexadecimal /st_tb/BAout
add wave -noupdate -radix hexadecimal /st_tb/Yin
add wave -noupdate -radix hexadecimal /st_tb/Cout
add wave -noupdate -radix hexadecimal /st_tb/ADD
add wave -noupdate -radix hexadecimal /st_tb/Gra
add wave -noupdate -radix hexadecimal /st_tb/Rout
add wave -noupdate -radix hexadecimal /st_tb/Write
add wave -noupdate -radix hexadecimal /st_tb/input_unit
add wave -noupdate -radix hexadecimal /st_tb/DUT/R6_val
add wave -noupdate -radix hexadecimal /st_tb/DUT/BusData
add wave -noupdate -radix hexadecimal /st_tb/DUT/IR_val
add wave -noupdate -radix hexadecimal /st_tb/DUT/Zlow_val
add wave -noupdate -radix hexadecimal /st_tb/MARout
add wave -noupdate -radix hexadecimal /st_tb/DUT/MDR_val
add wave -noupdate -radix hexadecimal {/st_tb/DUT/RAM_Unit/memory[31]}
add wave -noupdate -radix hexadecimal {/st_tb/DUT/RAM_Unit/memory[130]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {338720 ps} 0}
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
WaveRestoreZoom {0 ps} {362250 ps}
