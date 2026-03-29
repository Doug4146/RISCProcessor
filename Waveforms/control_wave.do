onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /control_tb/clock
add wave -noupdate -radix hexadecimal /control_tb/clear
add wave -noupdate -radix hexadecimal /control_tb/stop
add wave -noupdate -radix unsigned /control_tb/CPU/CU/present_state
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/IR_val
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/PC_val
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/MDR_val
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/MARout
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/R0_val
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/R1_val
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/R2_val
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/R3_val
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/R4_val
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/R5_val
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/R6_val
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/R7_val
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/R8_val
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/R9_val
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/R10_val
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/R11_val
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/R12_val
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/R13_val
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/R14_val
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/R15_val
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/HI_val
add wave -noupdate -radix hexadecimal /control_tb/CPU/DP/LO_val
add wave -noupdate -radix hexadecimal {/control_tb/CPU/DP/RAM_Unit/memory[163]}
add wave -noupdate -radix hexadecimal {/control_tb/CPU/DP/RAM_Unit/memory[137]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {13376820 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 191
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
WaveRestoreZoom {0 ps} {15776250 ps}
