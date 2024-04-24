debImport "-f" "filelist.f"
debLoadSimResult /home/ICer/ic_prjs/mian_p/tb_top.fsdb
wvCreateWindow
srcSelect -signal "data_out" -line 16 -pos 1 -win $_nTrace1
srcSelect -signal "keep_out" -line 17 -pos 1 -win $_nTrace1
srcSelect -signal "last_out" -line 18 -pos 1 -win $_nTrace1
srcSelect -signal "valid_out" -line 15 -pos 1 -win $_nTrace1
wvAddSignal -win $_nWave2 "/axi_stream_insert_header/data_out\[31:0\]" \
           "/axi_stream_insert_header/keep_out\[3:0\]" \
           "/axi_stream_insert_header/last_out" \
           "/axi_stream_insert_header/valid_out"
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1/axi_stream_insert_header" 0)}
wvAddSubGroup -win $_nWave2 -holdpost {axi_stream_insert_header}
wvAddSignal -win $_nWave2 "/axi_stream_insert_header/clk" \
           "/axi_stream_insert_header/rst_n" \
           "/axi_stream_insert_header/valid_in" \
           "/axi_stream_insert_header/data_in\[31:0\]" \
           "/axi_stream_insert_header/keep_in\[3:0\]" \
           "/axi_stream_insert_header/last_in" \
           "/axi_stream_insert_header/ready_in" \
           "/axi_stream_insert_header/valid_out" \
           "/axi_stream_insert_header/data_out\[31:0\]" \
           "/axi_stream_insert_header/keep_out\[3:0\]" \
           "/axi_stream_insert_header/last_out" \
           "/axi_stream_insert_header/ready_out" \
           "/axi_stream_insert_header/valid_insert" \
           "/axi_stream_insert_header/data_insert\[31:0\]" \
           "/axi_stream_insert_header/keep_insert\[3:0\]" \
           "/axi_stream_insert_header/byte_insert_cnt\[1:0\]" \
           "/axi_stream_insert_header/ready_insert"
wvSetPosition -win $_nWave2 {("G1/axi_stream_insert_header" 0)}
wvSetPosition -win $_nWave2 {("G1/axi_stream_insert_header" 17)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcHBSelect "tb_top" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_top" -delim "."
srcHBSelect "tb_top" -win $_nTrace1
srcHBSelect "tb_top.dut" -win $_nTrace1
srcHBSelect "tb_top.dut" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_top.dut" -delim "."
srcHBSelect "tb_top.dut" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {16 20 1 1 1 1} -backward
wvSelectGroup -win $_nWave2 {G1}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSelectGroup -win $_nWave2 {G2}
srcDeselectAll -win $_nTrace1
srcSelect -signal "valid_out" -line 15 -pos 1 -win $_nTrace1
srcSelect -signal "data_out" -line 16 -pos 1 -win $_nTrace1
srcSelect -signal "keep_out" -line 17 -pos 1 -win $_nTrace1
srcSelect -signal "last_out" -line 18 -pos 1 -win $_nTrace1
srcSelect -signal "ready_out" -line 19 -pos 1 -win $_nTrace1
wvAddSignal -win $_nWave2 "/tb_top/dut/valid_out" "/tb_top/dut/data_out\[31:0\]" \
           "/tb_top/dut/keep_out\[3:0\]" "/tb_top/dut/last_out" \
           "/tb_top/dut/ready_out"
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "valid_in" -line 9 -pos 1 -win $_nTrace1
srcSelect -signal "keep_in" -line 11 -pos 1 -win $_nTrace1
srcSelect -signal "data_in" -line 10 -pos 1 -win $_nTrace1
srcSelect -signal "last_in" -line 12 -pos 1 -win $_nTrace1
srcSelect -signal "ready_in" -line 13 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvAddSignal -win $_nWave2 "/tb_top/dut/valid_in" "/tb_top/dut/keep_in\[3:0\]" \
           "/tb_top/dut/data_in\[31:0\]" "/tb_top/dut/last_in" \
           "/tb_top/dut/ready_in"
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSelectGroup -win $_nWave2 {G4}
srcDeselectAll -win $_nTrace1
srcSelect -signal "ready_out" -line 19 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "frame_start_ready_flag" -line 95 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 "/tb_top/dut/frame_start_ready_flag"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetCursor -win $_nWave2 5797.062445 -snap {("G4" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_ready_in" -line 111 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvAddSignal -win $_nWave2 "/tb_top/dut/r_ready_in"
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "valid_in" -line 110 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvAddSignal -win $_nWave2 "/tb_top/dut/valid_in"
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "valid_out" -line 110 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvAddSignal -win $_nWave2 "/tb_top/dut/valid_out"
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_in_first_shake" -line 143 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvAddSignal -win $_nWave2 "/tb_top/dut/r_in_first_shake"
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "frame_start_ready_flag" -line 142 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvAddSignal -win $_nWave2 "/tb_top/dut/frame_start_ready_flag"
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "valid_in" -line 142 -pos 1 -win $_nTrace1
srcSelect -signal "ready_in" -line 142 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvAddSignal -win $_nWave2 "/tb_top/dut/valid_in" "/tb_top/dut/ready_in"
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 31660.879507 -snap {("G5" 7)}
wvSetCursor -win $_nWave2 29431.240106 -snap {("G5" 7)}
srcActiveTrace "tb_top.dut.ready_in" -win $_nTrace1 -TraceByDConWave -TraceTime 0 \
           -TraceValue z
srcDeselectAll -win $_nTrace1
srcSelect -signal "ready_in" -line 142 -pos 1 -win $_nTrace1
srcAction -pos 141 10 3 -win $_nTrace1 -name "ready_in" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ready_in" -line 142 -pos 1 -win $_nTrace1
srcAction -pos 141 10 3 -win $_nTrace1 -name "ready_in" -ctrlKey off
wvSetCursor -win $_nWave2 9810.413369 -snap {("G5" 5)}
wvSetCursor -win $_nWave2 18728.970976 -snap {("G3" 4)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoom -win $_nWave2 62.429903 459.305717
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcSelect -signal "data_out" -line 16 -pos 1 -win $_nTrace1
srcSelect -signal "keep_out" -line 17 -pos 1 -win $_nTrace1
srcSelect -signal "last_out" -line 18 -pos 1 -win $_nTrace1
wvScrollDown -win $_nWave2 3
srcSelect -signal "ready_out" -line 19 -pos 1 -win $_nTrace1
srcSelect -signal "valid_out" -line 15 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvAddSignal -win $_nWave2 "/tb_top/dut/data_out\[31:0\]" \
           "/tb_top/dut/keep_out\[3:0\]" "/tb_top/dut/last_out" \
           "/tb_top/dut/ready_out" "/tb_top/dut/valid_out"
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 )} 
wvSetCursor -win $_nWave2 5.236618 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 132.660977 -snap {("G6" 1)}
srcActiveTrace "tb_top.dut.data_out\[31:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 20 -TraceValue 00000000000000000000000000000000
nsMsgSwitchTab -tab general
wvSetCursor -win $_nWave2 114.158262 -snap {("G6" 1)}
srcActiveTrace "tb_top.dut.data_out\[31:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 20 -TraceValue 00000000000000000000000000000000
wvSetCursor -win $_nWave2 121.489526 -snap {("G6" 1)}
srcActiveTrace "tb_top.dut.data_out\[31:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 20 -TraceValue 00000000000000000000000000000000
srcHBSelect "tb_top.dut" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_top.dut" -delim "."
srcHBSelect "tb_top.dut" -win $_nTrace1
debReload
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_data_comb" -line 290 -pos 1 -win $_nTrace1
srcAction -pos 289 6 4 -win $_nTrace1 -name "r_data_comb" -ctrlKey off
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvAddSignal -win $_nWave2 "/tb_top/dut/r_data_comb\[31:0\]"
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetPosition -win $_nWave2 {("G7" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {163 163 6 13 1 2}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetPosition -win $_nWave2 {("G8" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G8" 0)}
wvAddSignal -win $_nWave2 "/tb_top/dut/frame_start_flag" "/tb_top/dut/valid_in" \
           "/tb_top/dut/r_ready_in"
wvSetPosition -win $_nWave2 {("G8" 0)}
wvSetPosition -win $_nWave2 {("G8" 3)}
wvSetPosition -win $_nWave2 {("G8" 3)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 48.176881 -snap {("G8" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 62.141194 -snap {("G9" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 100.193948 -snap {("G7" 1)}
wvSetCursor -win $_nWave2 101.939487 -snap {("G6" 1)}
srcActiveTrace "tb_top.dut.data_out\[31:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 100 -TraceValue xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_data_comb" -line 290 -pos 1 -win $_nTrace1
wvSetCursor -win $_nWave2 106.826997 -snap {("G7" 1)}
srcActiveTrace "tb_top.dut.r_data_comb\[31:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 100 -TraceValue xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_data_insert" -line 168 -pos 1 -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G8" 1 )} 
wvSelectSignal -win $_nWave2 {( "G8" 1 )} 
wvSelectSignal -win $_nWave2 {( "G8" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G9" 0)}
wvSetPosition -win $_nWave2 {("G8" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "frame_start_ready_flag" -line 142 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetPosition -win $_nWave2 {("G8" 0)}
wvAddSignal -win $_nWave2 "/tb_top/dut/frame_start_ready_flag"
wvSetPosition -win $_nWave2 {("G8" 0)}
wvSetPosition -win $_nWave2 {("G8" 1)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 80.643910 -snap {("G8" 3)}
wvSetCursor -win $_nWave2 80.643910 -snap {("G8" 3)}
wvSetCursor -win $_nWave2 80.643910 -snap {("G8" 3)}
wvSetCursor -win $_nWave2 83.087664 -snap {("G8" 3)}
srcActiveTrace "tb_top.dut.r_ready_in" -win $_nTrace1 -TraceByDConWave -TraceTime \
           80 -TraceValue 1
wvSetCursor -win $_nWave2 19.200931 -snap {("G8" 2)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvSetCursor -win $_nWave2 559.270750 -snap {("G6" 1)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetCursor -win $_nWave2 420.325832 -snap {("G3" 4)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 124.282389 -snap {("G6" 2)}
wvSetCursor -win $_nWave2 129.868114 -snap {("G6" 2)}
srcActiveTrace "tb_top.dut.keep_out\[3:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 120 -TraceValue xxxx
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_keep_comb" -line 289 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvAddSignal -win $_nWave2 "/tb_top/dut/r_keep_comb\[3:0\]"
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetCursor -win $_nWave2 143.832428 -snap {("G6" 3)}
srcActiveTrace "tb_top.dut.r_keep_comb\[3:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 120 -TraceValue xxxx
wvSetCursor -win $_nWave2 132.660977 -snap {("G6" 3)}
srcActiveTrace "tb_top.dut.r_keep_comb\[3:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 120 -TraceValue xxxx
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_keep_insert" -line 169 -pos 1 -win $_nTrace1
srcSelect -win $_nTrace1 -range {169 169 6 8 10 1}
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_keep_insert" -line 169 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvAddSignal -win $_nWave2 "/tb_top/dut/r_keep_insert\[3:0\]"
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 157.796741 -snap {("G6" 1)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_data_insert" -line 168 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvAddSignal -win $_nWave2 "/tb_top/dut/r_data_insert\[31:0\]"
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetCursor -win $_nWave2 120.093095 -snap {("G4" 2)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_insert_done_flag" -line 164 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_insert_done_flag" -line 164 -pos 1 -win $_nTrace1
srcAction -pos 163 5 10 -win $_nTrace1 -name "r_insert_done_flag" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_insert_done_flag" -line 164 -pos 1 -win $_nTrace1
srcAction -pos 163 5 10 -win $_nTrace1 -name "r_insert_done_flag" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_insert_done_flag" -line 164 -pos 1 -win $_nTrace1
srcSelect -win $_nTrace1 -range {164 164 6 6 12 15}
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_insert_done_flag" -line 164 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvAddSignal -win $_nWave2 "/tb_top/dut/r_insert_done_flag"
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "frame_start_flag" -line 163 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {163 163 6 13 1 1} -backward
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
debReload
srcSelect -signal "r_ori_last_dff" -line 188 -pos 1 -win $_nTrace1
srcSelect -signal "r_ori_data_dff" -line 187 -pos 1 -win $_nTrace1
srcSelect -signal "r_ori_keep_dff" -line 186 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_keep_insert" -line 180 -pos 1 -win $_nTrace1
srcSelect -signal "r_data_insert" -line 179 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvAddSignal -win $_nWave2 "/tb_top/dut/r_keep_insert\[3:0\]" \
           "/tb_top/dut/r_data_insert\[31:0\]"
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetCursor -win $_nWave2 156.400310 -snap {("G6" 9)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "frame_start_ready_flag" -line 205 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 9)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvAddSignal -win $_nWave2 "/tb_top/dut/frame_start_ready_flag"
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetCursor -win $_nWave2 115.903801 -snap {("G5" 7)}
wvSetCursor -win $_nWave2 86.578743 -snap {("G5" 6)}
wvSetCursor -win $_nWave2 160.589604 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 122.885957 -snap {("G5" 7)}
wvSetCursor -win $_nWave2 124.282389 -snap {("G6" 9)}
wvSetCursor -win $_nWave2 156.400310 -snap {("G6" 3)}
wvSetCursor -win $_nWave2 120.093095 -snap {("G5" 7)}
srcSelect -signal "r_ori_keep_dff" -line 191 -pos 1 -win $_nTrace1
srcSelect -signal "r_ori_data_dff" -line 192 -pos 1 -win $_nTrace1
srcSelect -signal "r_ori_last_dff" -line 193 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 8)}
wvAddSignal -win $_nWave2 "/tb_top/dut/frame_start_ready_flag" \
           "/tb_top/dut/r_ori_keep_dff\[3:0\]" \
           "/tb_top/dut/r_ori_data_dff\[31:0\]" "/tb_top/dut/r_ori_last_dff"
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G5" 12)}
wvSetCursor -win $_nWave2 155.003878 -snap {("G5" 11)}
wvSetCursor -win $_nWave2 118.696663 -snap {("G5" 11)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_in_first_shake" -line 149 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G5" 9)}
wvSetPosition -win $_nWave2 {("G5" 10)}
wvSetPosition -win $_nWave2 {("G5" 11)}
wvSetPosition -win $_nWave2 {("G5" 12)}
wvAddSignal -win $_nWave2 "/tb_top/dut/r_in_first_shake"
wvSetPosition -win $_nWave2 {("G5" 12)}
wvSetPosition -win $_nWave2 {("G5" 13)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
debReload
debReload
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 149.418153 -snap {("G6" 2)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G5" 8 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 164.778898 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 445.461596 -snap {("G2" 4)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 418.929401 -snap {("G7" 1)}
wvSetCursor -win $_nWave2 442.668733 -snap {("G7" 1)}
wvSetCursor -win $_nWave2 445.461596 -snap {("G6" 9)}
srcActiveTrace "tb_top.dut.valid_out" -win $_nTrace1 -TraceByDConWave -TraceTime \
           440 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_valid_out" -line 343 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G5" 10)}
wvSetPosition -win $_nWave2 {("G5" 9)}
wvSetPosition -win $_nWave2 {("G5" 10)}
wvSetPosition -win $_nWave2 {("G5" 11)}
wvSetPosition -win $_nWave2 {("G5" 12)}
wvSetPosition -win $_nWave2 {("G5" 13)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G6" 9)}
wvAddSignal -win $_nWave2 "/tb_top/dut/r_valid_out"
wvSetPosition -win $_nWave2 {("G6" 9)}
wvSetPosition -win $_nWave2 {("G6" 10)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_pre_last_work" -line 343 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G5" 9)}
wvSetPosition -win $_nWave2 {("G5" 13)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 9)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G6" 10)}
wvAddSignal -win $_nWave2 "/tb_top/dut/r_pre_last_work"
wvSetPosition -win $_nWave2 {("G6" 10)}
wvSetPosition -win $_nWave2 {("G6" 11)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_valid_out" -line 343 -pos 1 -win $_nTrace1
srcAction -pos 342 6 4 -win $_nTrace1 -name "r_valid_out" -ctrlKey off
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "frame_busy" -line 219 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 "/tb_top/dut/frame_busy"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_last_comb" -line 215 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 "/tb_top/dut/r_last_comb"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_ori_keep_dff" -line 256 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_ori_last_dff" -line 254 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvAddSignal -win $_nWave2 "/tb_top/dut/r_ori_last_dff"
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetCursor -win $_nWave2 419.035082 -snap {("G3" 7)}
wvSetCursor -win $_nWave2 439.986836 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 423.225433 -snap {("G3" 6)}
debReload
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSetCursor -win $_nWave2 434.399702 -snap {("G2" 1)}
srcActiveTrace "tb_top.dut.valid_out" -win $_nTrace1 -TraceByDConWave -TraceTime \
           420 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_valid_out" -line 361 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvAddSignal -win $_nWave2 "/tb_top/dut/r_valid_out"
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetCursor -win $_nWave2 437.193269 -snap {("G2" 2)}
srcActiveTrace "tb_top.dut.r_valid_out" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 420 -TraceValue 1
debReload
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 460.938591 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 442.780404 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 461.102942 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 476.473040 -snap {("G3" 6)}
srcActiveTrace "tb_top.dut.r_ori_last_dff" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 420 -TraceValue 1
wvSetCursor -win $_nWave2 456.911097 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 473.678477 -snap {("G3" 7)}
srcActiveTrace "tb_top.dut.frame_busy" -win $_nTrace1 -TraceByDConWave -TraceTime \
           420 -TraceValue 1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 456.911097 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 947.356954 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 962.727052 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 976.699869 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 1462.953880 -snap {("G2" 2)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 1500.680485 -snap {("G5" 1)}
srcActiveTrace "tb_top.dut.r_ready_in" -win $_nTrace1 -TraceByDConWave -TraceTime \
           1460 -TraceValue 0
wvSetCursor -win $_nWave2 1422.432713 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 1462.953880 -snap {("G3" 6)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 1450.378346 -snap {("G3" 7)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 455.513816 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 1468.543007 -snap {("G3" 6)}
srcActiveTrace "tb_top.dut.r_ori_last_dff" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 1420 -TraceValue 1
wvSetCursor -win $_nWave2 979.494432 -snap {("G2" 5)}
debReload
wvSetCursor -win $_nWave2 1419.638149 -snap {("G2" 4)}
debReload
wvSetCursor -win $_nWave2 1961.783427 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 936.178701 -snap {("G2" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_pre_last" -line 293 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvAddSignal -win $_nWave2 "/tb_top/dut/r_pre_last"
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_ori_keep_comb\[0\]" -line 292 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvAddSignal -win $_nWave2 "/tb_top/dut/r_ori_keep_comb\[0\]"
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
debReload
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_ori_keep_dff\[0\]" -line 292 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvAddSignal -win $_nWave2 "/tb_top/dut/r_ori_keep_dff\[0\]"
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_pre_last" -line 296 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_pre_last" -line 293 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvAddSignal -win $_nWave2 "/tb_top/dut/r_pre_last"
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_ori_keep_dff\[0\]" -line 292 -pos 1 -win $_nTrace1
debReload
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
debReload
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
debReload
debReload
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSetCursor -win $_nWave2 444.335563 -snap {("G2" 1)}
debReload
wvSetCursor -win $_nWave2 958.535207 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 938.973264 -snap {("G2" 7)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "r_pre_last_work" -line 359 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvAddSignal -win $_nWave2 "/tb_top/dut/r_pre_last_work"
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "w_valid_out" -line 358 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvAddSignal -win $_nWave2 "/tb_top/dut/w_valid_out"
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
debReload
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 740.559271 -snap {("G2" 3)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
