set projDir "/home/yi/mojo/8_bit_alu/work/planAhead"
set projName "8_bit_alu"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/yi/mojo/8_bit_alu/work/verilog/mojo_top_0.v" "/home/yi/mojo/8_bit_alu/work/verilog/reset_conditioner_1.v" "/home/yi/mojo/8_bit_alu/work/verilog/multi_seven_seg_2.v" "/home/yi/mojo/8_bit_alu/work/verilog/alu_3.v" "/home/yi/mojo/8_bit_alu/work/verilog/counter_4.v" "/home/yi/mojo/8_bit_alu/work/verilog/seven_seg_5.v" "/home/yi/mojo/8_bit_alu/work/verilog/decoder_6.v" "/home/yi/mojo/8_bit_alu/work/verilog/adder8_7.v" "/home/yi/mojo/8_bit_alu/work/verilog/shifter8_8.v" "/home/yi/mojo/8_bit_alu/work/verilog/boolean8_9.v" "/home/yi/mojo/8_bit_alu/work/verilog/compare8_10.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list  "/home/yi/mojo-ide-B1.3.6/library/components/io_shield.ucf" "/home/yi/mojo-ide-B1.3.6/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
