onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /brnz_tb/clock
add wave -noupdate -radix hexadecimal /brnz_tb/clear
add wave -noupdate -radix hexadecimal /brnz_tb/Present_state
add wave -noupdate -radix hexadecimal /brnz_tb/MARin
add wave -noupdate -radix hexadecimal /brnz_tb/PCout
add wave -noupdate -radix hexadecimal /brnz_tb/Zin
add wave -noupdate -radix hexadecimal /brnz_tb/Zlowout
add wave -noupdate -radix hexadecimal /brnz_tb/PCin
add wave -noupdate -radix hexadecimal /brnz_tb/MDRin
add wave -noupdate -radix hexadecimal /brnz_tb/Read
add wave -noupdate -radix hexadecimal /brnz_tb/MDRout
add wave -noupdate -radix hexadecimal /brnz_tb/IRin
add wave -noupdate -radix hexadecimal /brnz_tb/Gra
add wave -noupdate -radix hexadecimal /brnz_tb/CONin
add wave -noupdate -radix hexadecimal /brnz_tb/Rout
add wave -noupdate -radix hexadecimal /brnz_tb/Yin
add wave -noupdate -radix hexadecimal /brnz_tb/Cout
add wave -noupdate -radix hexadecimal /brnz_tb/ADD
add wave -noupdate -radix hexadecimal /brnz_tb/CON_val
add wave -noupdate -radix decimal /brnz_tb/DUT/BusData
add wave -noupdate -radix decimal /brnz_tb/DUT/R3_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {121020 ps} 0}
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
