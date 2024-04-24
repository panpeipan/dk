module register_slices
#( 
    parameter payload_width                          = 32 ,
    parameter DATA_BYTE_WD                           = payload_width/8,
    parameter DATA_CNT_WD                            = $clog2(DATA_BYTE_WD),
    parameter forward_register_slices_generate_flag  = 0 ,
    parameter backward_register_slices_generate_flag = 0 
)
(
    input  wire                          i_hclk           ,
    input  wire                          i_hrstn          ,
    input  wire                          i_source_valid   ,
    input  wire [payload_width-1:0]      i_source_payload ,
    input  wire [DATA_BYTE_WD-1:0]       i_source_keepin  ,
    input  wire                          i_source_last    ,
    input  wire [DATA_CNT_WD-1:0]        i_source_cnt     ,
    output wire                          o_source_ready   ,
    output wire                          o_dest_valid     ,
    output wire [payload_width-1:0]      o_dest_payload   ,
    output wire [DATA_BYTE_WD-1:0]       o_dest_keepin    ,
    output wire                          o_dest_last      , 
    output wire [DATA_CNT_WD-1:0]        o_dest_cnt       ,
    input  wire                          i_dest_ready     
    
); 
// forward方向是数据流向方向，也是前向方向            //
// valid   :  source -> backward -> forward -> dest   //
// paylaod :  source -> backward -> forward -> dest   //
// ready   :  source <- backward <- forward <- dest   //
//----------------------------------------------------//
// wire
//----------------------------------------------------// 
wire                     w_backward_valid   ;
wire [payload_width-1:0] w_backward_payload ;
wire [DATA_BYTE_WD-1:0]  w_backward_keepin  ;
wire                     w_backward_last    ;
wire [DATA_CNT_WD-1:0]   w_backward_cnt     ;
wire                     w_backward_ready   ;
wire                     w_forward_valid    ;
wire [payload_width-1:0] w_forward_payload  ;
wire [DATA_BYTE_WD-1:0]  w_forward_keepin   ;
wire                     w_forward_last     ;
wire [DATA_CNT_WD-1:0]   w_forward_cnt      ;
wire                     w_forward_ready    ;

//----------------------------------------------------//
// main_code
//----------------------------------------------------//

//----------------------------------------------------//
// forward 
//----------------------------------------------------// 
    generate if(forward_register_slices_generate_flag == 1)begin 
        reg                        r_rs_dst_valid   ;
        reg  [payload_width-1:0]   r_rs_dst_payload ;
        reg  [DATA_BYTE_WD-1:0]    r_rs_dst_keepin  ;
        reg                        r_rs_dst_last    ;
        reg  [DATA_CNT_WD-1:0]     r_rs_dst_cnt     ;

        assign w_forward_payload = r_rs_dst_payload ;
        assign w_forward_keepin  = r_rs_dst_keepin  ;
        assign w_forward_last    = r_rs_dst_last    ;
        assign w_forward_cnt     = r_rs_dst_cnt     ;
        assign w_forward_valid   = r_rs_dst_valid   ;
        assign w_forward_ready   = i_dest_ready | ~r_rs_dst_valid    ;// dest_ready|~payload_full
        //对于FORWARD RS，PLD与VLD通过一级寄存器寄存，RDY通过组合电路获得//
        //前向通道通过加入寄存器，完成了PATH切片                         //
        //而为了提高性能，FW-RDY与DST—RDY和PAYLOAD-FULL有关              //
        always @(posedge i_hclk or negedge i_hrstn) begin
            if (!i_hrstn) begin
                r_rs_dst_valid <= 1'b0 ;
            end 
            else if (w_backward_valid) begin
                r_rs_dst_valid <= 1'b1 ;
            end 
            else if (w_forward_ready ) begin
                r_rs_dst_valid <= 1'b0 ;
            end
        end
        
        always @(posedge i_hclk or negedge i_hrstn) begin
            if (!i_hrstn) begin
                r_rs_dst_payload <= 'b0 ;
                r_rs_dst_keepin  <= 'b0 ;
                r_rs_dst_last    <= 'b0 ;
                r_rs_dst_cnt     <= 'b0 ;
            end 
            else if ((w_backward_valid&&w_forward_ready)||(w_backward_valid&&~r_rs_dst_valid)) begin
                r_rs_dst_payload <= w_backward_payload ;
                r_rs_dst_keepin  <= w_backward_keepin  ;
                r_rs_dst_cnt     <= w_backward_cnt     ;
            end 
            else if ((w_backward_valid&&w_forward_ready)||(w_backward_valid&&~r_rs_dst_valid)) begin
                r_rs_dst_payload <= w_backward_payload ;
                r_rs_dst_keepin  <= w_backward_keepin  ;
                r_rs_dst_last    <= w_backward_last    ;
                r_rs_dst_cnt     <= w_backward_cnt     ;
            end 
            else begin
                r_rs_dst_payload <= r_rs_dst_payload   ; 
                r_rs_dst_keepin  <= r_rs_dst_keepin    ;
                r_rs_dst_last    <= r_rs_dst_last      ;
                r_rs_dst_cnt     <= r_rs_dst_cnt       ;
            end
        end  

    end 
    else begin 
        assign w_forward_payload = w_backward_payload ;
        assign w_forward_keepin  = w_backward_keepin  ;
        assign w_forward_last    = w_backward_last    ;
        assign w_forward_cnt     = w_backward_cnt     ;
        assign w_forward_valid   = w_backward_valid   ;
        assign w_forward_ready   = i_dest_ready       ;
    end 
    endgenerate
//----------------------------------------------------//
// backward 
//----------------------------------------------------// 
generate if (backward_register_slices_generate_flag == 1) begin
        reg   [payload_width-1:0]    r_rs_src_payload ; 
        reg   [DATA_BYTE_WD -1:0]    r_rs_src_keepin  ;
        reg                          r_rs_src_last    ;
        reg   [DATA_CNT_WD-1:0]      r_rs_src_cnt     ;
        reg                          r_rs_src_ready   ;
        assign w_backward_valid   = i_source_valid | ~r_rs_src_ready ;
        assign w_backward_payload = r_rs_src_ready ?  i_source_payload : r_rs_src_payload ; 
        assign w_backward_keepin  = r_rs_src_ready ?  i_source_keepin  : r_rs_src_keepin ;
        assign w_backward_last    = r_rs_src_ready ?  i_source_last    : r_rs_src_last   ; 
        assign w_backward_cnt     = r_rs_src_ready ?  i_source_cnt     : r_rs_src_cnt    ;
        assign w_backward_ready   = r_rs_src_ready ;
        //backward register_slices 基于R_RS_READY为参考作为backward_reg暂存标准
        always @(posedge i_hclk or negedge i_hrstn) begin
            if (!i_hrstn) begin 
                r_rs_src_ready <= 1'b1 ;
            end 
            else if (w_forward_ready) begin
                r_rs_src_ready <= 1'b1 ;
            end
            else if (i_source_valid) begin 
                r_rs_src_ready <= 1'b0 ;
            end  
            else begin
                r_rs_src_ready <= r_rs_src_ready ;
            end
        end  

        always @(posedge i_hclk or negedge i_hrstn) begin
            if (!i_hrstn) begin
                r_rs_src_payload <= 'd0 ;
                r_rs_src_keepin  <= 'd0 ; 
                r_rs_src_last    <= 'd0 ;
                r_rs_src_cnt     <= 'd0 ;
            end 
            else if (i_source_valid&r_rs_src_ready) begin
                r_rs_src_payload <= i_source_payload ;
                r_rs_src_keepin  <= i_source_keepin  ; 
                r_rs_src_last    <= i_source_last    ; 
                r_rs_src_cnt     <= i_source_cnt     ;
            end 
            else if (i_source_valid&w_forward_ready) begin
                r_rs_src_payload <= i_source_payload ;
                r_rs_src_keepin  <= i_source_keepin  ; 
                r_rs_src_last    <= i_source_last    ; 
                r_rs_src_cnt     <= i_source_cnt     ;
            end 
            else begin
                r_rs_src_payload <= r_rs_src_payload ;
                r_rs_src_keepin  <= r_rs_src_keepin  ; 
                r_rs_src_last    <= r_rs_src_last    ;
                r_rs_src_cnt     <= r_rs_src_cnt     ;
            end
        end  

    end 
    else begin
        assign w_backward_valid   = i_source_valid   ;
        assign w_backward_payload = i_source_payload ;
        assign w_backward_keepin  = i_source_keepin  ;
        assign w_backward_last    = i_source_last    ;
        assign w_backward_cnt     = i_source_cnt     ;
        assign w_backward_ready   = w_forward_ready  ;
    end
endgenerate 
    

//----------------------------------------------------//
// assign
//----------------------------------------------------//
assign   o_dest_valid   = w_forward_valid    ; 
assign   o_dest_payload = w_forward_payload  ;
assign   o_dest_keepin  = w_forward_keepin   ;
assign   o_dest_last    = w_forward_last     ;
assign   o_dest_cnt     = w_forward_cnt      ;
assign   o_source_ready = w_backward_ready   ;
endmodule 
