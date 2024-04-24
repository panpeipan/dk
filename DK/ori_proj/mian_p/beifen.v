module axi_stream_insertbeifen_header #(
    parameter DATA_WD = 32,
    parameter DATA_BYTE_WD = DATA_WD / 8,
    parameter BYTE_CNT_WD = $clog2(DATA_BYTE_WD)
) (
    input                       clk,
    input                       rst_n,
    // AXI Stream input original data
    input                       valid_in,
    input [DATA_WD-1 : 0]       data_in,
    input [DATA_BYTE_WD-1 : 0]  keep_in,
    input                       last_in,
    output                      ready_in,
    // AXI Stream output with header inserted
    output                       valid_out      ,
    output  [DATA_WD-1 : 0]      data_out       ,
    output  [DATA_BYTE_WD-1 : 0] keep_out       ,
    output                       last_out       ,
    input                        ready_out      ,
    // The header to be inserted to AXI Stream input
    input                        valid_insert   ,
    input [DATA_WD-1 : 0]        data_insert    ,
    input [DATA_BYTE_WD-1 : 0]   keep_insert    ,
    input [BYTE_CNT_WD-1 : 0]    byte_insert_cnt,
    output                       ready_insert
);
//----------------------------------------------------//
// local parameter
//----------------------------------------------------//

//----------------------------------------------------//
// reg
//----------------------------------------------------//
reg                         r_frame_n                 ;
reg                         r_insert_data_comb_frame_n;

reg [DATA_WD-1:0]           r_ori_data_comb   ;
reg [DATA_WD-1:0]           r_ori_data_comb_temp ;
reg [DATA_BYTE_WD-1:0]      r_ori_first_keep  ;
reg [DATA_BYTE_WD-1:0]      r_keep_in         ;
reg [DATA_WD-1:0]           r_data_in_dff     ;

reg [DATA_WD-1:0]           r_data_insert     ;
reg [DATA_BYTE_WD-1:0]      r_keep_insert     ;

reg dff_0 ,dff_1;
reg                         r_valid_out       ;
reg                         r_last_out        ; 

reg  [DATA_WD-1 : 0]        r_data_comb       ;

reg                         r_ready_insert    ;
//keep_out dff
reg [DATA_BYTE_WD-1:0]      r_ori_keep_comb   ;
reg [DATA_BYTE_WD-1:0]      r_ori_keep_comb_temp  ;
reg [DATA_BYTE_WD-1:0]      r_ori_keep_dff    ;
reg [DATA_BYTE_WD-1:0]      r_insert_keep_dff ;
reg [DATA_BYTE_WD-1:0]      r_keep_comb       ;

reg                         r_data_para_done_flag  ; 
reg                         r_insert_done_flag     ;
reg                         frame_finish_flag ;
reg                         r_ori_keep_dff_empty_flag ;
//----------------------------------------------------//
// wire
//----------------------------------------------------//
wire                       w_valid_in       ;
wire [DATA_WD-1 : 0]       w_data_in        ;
wire [DATA_BYTE_WD-1 : 0]  w_keep_in        ;
wire                       w_last_in        ;
wire                       w_ready_in       ;
    
wire                       w_valid_insert   ;
wire  [DATA_WD-1 : 0]      w_data_insert    ;
wire  [DATA_BYTE_WD-1 : 0] w_keep_insert    ;
wire  [BYTE_CNT_WD-1 : 0]  w_byte_insert_cnt;
wire                       w_ready_insert   ;

wire                       frame_start_flag ;
wire                       stop_pipe_line_flag ;
wire                       w_ori_data_comb_frame_n   ;
//----------------------------------------------------//
// main_code
//----------------------------------------------------//
always@(posedge clk or negedge rst_n)begin 
    if (!rst_n) begin 
        frame_finish_flag <= 1'b0 ;
    end  
    else if (w_last_in&w_valid_in&w_ready_in) begin
        frame_finish_flag <= 1'b1 ;
    end 
    else begin
        frame_finish_flag <= 1'b0 ;
    end
end
always@(posedge clk or negedge rst_n)begin 
    if (!rst_n) begin
        r_frame_n <= 1'b1 ;
    end 
    else if (frame_start_flag) begin
        r_frame_n <= 1'b0 ;
    end 
    else if (frame_finish_flag)begin 
        r_frame_n <= 1'b1;
    end  
    else begin
        r_frame_n <= r_frame_n ;
    end
end 

assign w_ori_data_comb_frame_n = r_frame_n;
always@(posedge clk or negedge rst_n)begin 
    if (!rst_n) begin 
        r_insert_data_comb_frame_n <= 1'b0;
    end 
    else begin
        r_insert_data_comb_frame_n <= r_frame_n;
    end
end

always@(posedge clk or negedge rst_n )begin 
    if (!rst_n) begin
        r_data_insert <= 'b0 ;
        r_keep_insert <= 'b0 ;
    end 
    else if (w_valid_insert&&w_ready_insert) begin
        r_data_insert <= w_data_insert ;
        r_keep_insert <= w_keep_insert ;
    end 
end  
// reg [DATA_BYTE_WD-1:0] r_last_keep_in ;
// always @(posedge clk or negedge rst_n) begin
    // if (!rst_n) begin
        // r_last_keep_in <= 'b0 ;
    // end 
    // else if (w_valid_in&&w_ready_in&&w_last_in) begin
        // r_last_keep_in <= w_keep_in ;
    // end
// end


reg dff_2 ;
reg dff_3 ;
reg [DATA_BYTE_WD-1:0] r_ori_keep_ckc;
reg r_keep_dff_empty_flag ;
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)begin 
        r_ori_keep_dff_empty_flag <= 1'b0 ;
    end  
    // else if (ready_out&&valid_out&&r_ori_keep_dff_empty_flag) begin
        // r_ori_keep_dff_empty_flag <= 1'b0;
    // end 
    else if (r_ori_keep_dff_empty_flag) begin
        r_ori_keep_dff_empty_flag <= 1'b0;
    end 
    else if (dff_1)begin
        case (r_keep_insert) //TODO 
            4'b0111: begin
                if (r_ori_keep_ckc[2]==1'b1) begin
                    r_ori_keep_dff_empty_flag <= 1'b0 ;
                end  
                else begin
                    r_ori_keep_dff_empty_flag <= 1'b1 ;
                end
            end
            4'b0011: begin
                if (r_ori_keep_ckc[1]==1'b1) begin
                    r_ori_keep_dff_empty_flag <= 1'b0;
                end 
                else begin
                    r_ori_keep_dff_empty_flag <= 1'b1 ;
                end
            end
            4'b0001: begin
                if (r_ori_keep_ckc[0]==1'b1) begin
                    r_ori_keep_dff_empty_flag <= 1'b0;
                end 
                else begin
                    r_ori_keep_dff_empty_flag <= 1'b1 ;
                end
            end
            default: begin
                r_ori_keep_dff_empty_flag <= 1'b0 ;
            end
        endcase 
        if (r_ori_keep_ckc==4'b0) begin
            r_ori_keep_dff_empty_flag <= 1'b1 ;
        end
    end 
    else begin
        r_ori_keep_dff_empty_flag <= r_ori_keep_dff_empty_flag;
    end
end 
always @(*) begin 
    if (dff_1) begin
        case (r_ori_first_keep) 
            4'b1111: begin  
                if (r_ori_keep_dff[3:0]==4'b0) begin
                    r_keep_dff_empty_flag  = 1'b1 ;
                end
                r_ori_keep_ckc = r_ori_keep_dff ; 
            end 
            4'b0111: begin  
                if (r_ori_keep_dff[3:0]==4'b0) begin
                    r_keep_dff_empty_flag  = 1'b1 ;
                end
                r_ori_keep_ckc = {r_ori_keep_dff[2:0],1'b0}; 
            end 
            4'b0011: begin 
                if (r_ori_keep_dff[3:0]==4'b0) begin
                    r_keep_dff_empty_flag  = 1'b1 ;
                end
                r_ori_keep_ckc = {r_ori_keep_dff[1:0],2'b0}; 
            end 
            4'b0001: begin
                if (r_ori_keep_dff[3:0]==4'b0) begin
                    r_keep_dff_empty_flag  = 1'b1 ;
                end
                r_ori_keep_ckc = {r_ori_keep_dff[0],3'b0}; 
            end  
            default:  begin 
                r_ori_keep_ckc = r_ori_keep_dff ; 
            end 
        endcase
    end 
    else begin
        r_keep_dff_empty_flag = 1'b0;
    end
end

//TODO 最后的KEEPOUT需要考虑 
always@(posedge clk or negedge rst_n)begin 
    if (!rst_n) begin 
        r_data_comb <= 'd0 ;
        r_ori_data_comb_temp <= 'd0 ;
        r_keep_comb <= 'b0 ;
        r_ori_keep_comb_temp <= 'd0;
        r_insert_done_flag <= 1'b0 ;
    end  
    else if (r_ori_keep_dff_empty_flag||dff_3) begin
        r_ori_data_comb_temp <= r_ori_data_comb ;
        r_ori_keep_comb_temp <= r_ori_keep_comb ;
        r_insert_done_flag <= 1'b0;
    end
    else if (~stop_pipe_line_flag&&~r_insert_data_comb_frame_n)begin  
        if (~r_insert_done_flag||(last_out&&valid_out&&ready_out)) begin
            case (r_keep_insert) 
               4'b1111: begin
                   r_data_comb <= r_data_insert ; 
                   r_keep_comb <= r_keep_insert ; 
               end 
               4'b0111: begin  
                   r_data_comb <= {r_data_insert[23:0],r_ori_data_comb[31:24]};
                   r_keep_comb <= {r_keep_insert[2:0] ,r_ori_keep_comb[3]}; 
               end 
               4'b0011: begin 
                   r_data_comb <= {r_data_insert[15:0],r_ori_data_comb[31:16]};
                   r_keep_comb <= {r_keep_insert[1:0] ,r_ori_keep_comb[3:2]};
               end 
               4'b0001:  begin 
                   r_data_comb <= {r_data_insert[7:0],r_ori_data_comb[31:8]};
                   r_keep_comb <= {r_keep_insert[0] ,r_ori_keep_comb[3:1]}; 
               end 
               default: begin 
                   r_data_comb <= r_data_insert ;
                   r_keep_comb <= r_keep_insert ; 
               end 
            endcase           
            r_ori_data_comb_temp <= r_ori_data_comb ;
            r_ori_keep_comb_temp <= r_ori_keep_comb ;
            r_insert_done_flag <= 1'b1 ;
        end 
        else begin
            case (r_keep_insert) 
               4'b1111: begin 
                   r_data_comb <= r_ori_data_comb ; 
                   r_keep_comb <= r_ori_keep_comb ; 
               end 
               4'b0111: begin 
                 if (dff_2) begin
                     r_data_comb <= {r_ori_data_comb_temp[23:0],{8'hfe}};
                     r_keep_comb <= {r_ori_keep_comb_temp[2:0] ,1'b0};   
                 end 
                 else begin
                     r_data_comb <= {r_ori_data_comb_temp[23:0],r_ori_data_comb[31:24]};
                     r_keep_comb <= {r_ori_keep_comb_temp[2:0] ,r_ori_keep_comb[3]};   
                 end
               end 
               4'b0011:  begin
                   if (dff_2) begin
                       r_data_comb <= {r_ori_data_comb_temp[15:0],{2{8'hfe}}};
                       r_keep_comb <= {r_ori_keep_comb_temp[1:0] ,2'b0};   
                   end 
                   else begin
                       r_data_comb <= {r_ori_data_comb_temp[15:0],r_ori_data_comb[31:16]};
                       r_keep_comb <= {r_ori_keep_comb_temp[1:0] ,r_ori_keep_comb[3:2]};   
                   end
               end 
               4'b0001:  begin 
                   if (dff_2) begin
                       r_data_comb <= {r_ori_data_comb_temp[7:0],{3{8'hfe}}};
                       r_keep_comb <= {r_ori_keep_comb_temp[0] ,3'b0};   
                   end 
                   else begin
                       r_data_comb <= {r_ori_data_comb_temp[7:0],r_ori_data_comb[31:8]};
                       r_keep_comb <= {r_ori_keep_comb_temp[0] ,r_ori_keep_comb[3:1]};   
                   end
               end
               default:  begin
                   r_data_comb <= r_ori_data_comb_temp ; 
                   r_keep_comb <= r_ori_keep_comb_temp ; 
               end 
            endcase
            r_ori_data_comb_temp <= r_ori_data_comb;
            r_ori_keep_comb_temp <= r_ori_keep_comb;
        end 
    end 
    else if (last_out&&valid_out&&ready_out) begin
        r_insert_done_flag <= 1'b0 ;
    end 
end
always@(posedge clk or negedge rst_n)begin 
    if (!rst_n) begin 
        r_valid_out <= 1'b0 ; 
        dff_3 <= 1'b1 ;
    end  
    else if (r_ori_keep_dff_empty_flag) begin 
        r_valid_out <= 1'b0 ;
        dff_3 <= 1'b1;
    end
    else if (dff_3) begin
        r_valid_out <= 1'b0 ;
        dff_3 <= 1'b0; 
    end 
    else if (~stop_pipe_line_flag&&~r_insert_data_comb_frame_n)begin  
        r_valid_out <= 1'b1 ;
    end 
    else if (r_valid_out&&ready_out) begin
        r_valid_out <= 1'b0 ;
    end
    else begin 
        r_valid_out <= r_valid_out ;
    end 
end

always@(posedge clk or negedge rst_n)begin 
    if (!rst_n) begin  
        dff_0      <= 1'b0 ;
        dff_1      <= 1'b0 ;
        dff_2      <= 1'b0 ;
        r_last_out <= 1'b0 ;
    end  
    else if (r_ori_keep_dff_empty_flag) begin
        dff_0      <= 1'b0 ;
        dff_1      <= 1'b0 ;
        dff_2      <= 1'b0 ;
        r_last_out <= 1'b0 ;
    end
    else if (w_valid_in&&w_ready_in&&w_last_in) begin
        dff_0      <= 1'b1  ;
        dff_1      <= dff_0 ;
        dff_2      <= dff_1 ;
        r_last_out <= dff_2 ;
    end 
    else if (valid_out&&ready_out) begin
        dff_0      <= 1'b0  ; 
        dff_1      <= dff_0 ;
        dff_2      <= dff_1 ;
        r_last_out <= dff_2 ;
    end
end

reg r_ori_first_keep_change_flag ;
reg [DATA_BYTE_WD-1:0] r_ori_keep ;
always@(posedge clk or negedge rst_n)begin 
    if (!rst_n) begin 
        r_ori_first_keep <= 'b0 ;
        r_ori_first_keep_change_flag <= 1'b0; 
        r_keep_in <= 1'b0 ;
    end  
    else if (valid_out&&ready_out&&dff_1&&r_ori_first_keep_change_flag) begin
        r_ori_first_keep <= r_keep_in;
        r_ori_first_keep_change_flag <= 1'b0 ;
    end
    else if (frame_start_flag&&r_frame_n&&r_insert_data_comb_frame_n) begin 
        r_ori_first_keep <= w_keep_in ;
    end 
    else if (frame_start_flag) begin
        r_keep_in <= w_keep_in ;
        r_ori_first_keep_change_flag <= 1'b1; 
    end
end 

reg     r_ori_keep_dff0;
always@(posedge clk or negedge rst_n)begin 
    if (!rst_n) begin 
        r_ori_keep_dff0  <= 'b0 ;
    end  
    else if (w_valid_in&&w_ready_in) begin
        r_ori_keep_dff0  <= w_keep_in ;
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        r_ready_insert <= 1'b0 ;
    end 
    else if (frame_start_flag) begin
        r_ready_insert <= 1'b1 ;
    end 
    else begin
        r_ready_insert <= 1'b0 ;
    end
end
//TODO 如果源数据不有效，需要反压流水线
always@(posedge clk or negedge rst_n)begin 
    if (!rst_n) begin 
        r_data_para_done_flag <= 1'b0 ;
    end  
    else if (frame_start_flag) begin
        r_data_para_done_flag <= 1'b0 ;
    end 
    else if (~r_frame_n) begin
        r_data_para_done_flag <= 1'b1 ;
    end
end  
always@(posedge clk or negedge rst_n)begin 
    if (!rst_n) begin 
        r_ori_data_comb <= 'b0 ; 
        r_ori_keep_comb <= 'd0 ; 
    end 
    // else if (r_ori_keep_dff_empty_flag) begin
        // r_ori_data_comb <= 'd0;
        // r_ori_keep_comb <= 'd0;
    // end
    else if (~r_frame_n && ~stop_pipe_line_flag) begin
        case (r_ori_first_keep) 
            4'b1111: begin  
               r_ori_data_comb <= r_data_in_dff  ; 
               r_ori_keep_comb <= r_ori_keep_dff ; 
            end 
            4'b0111: begin  
                if (dff_1) begin  
                   r_ori_data_comb <= {r_data_in_dff[23:0],{8'hff}};
                   r_ori_keep_comb <= {r_ori_keep_dff[2:0],1'b0}; 
                end 
                else begin
                    r_ori_data_comb <= {r_data_in_dff[23:0],w_data_in[31:24]};
                    r_ori_keep_comb <= {r_ori_keep_dff[2:0],w_keep_in[3]}; 
                end 
           end 
           4'b0011: begin 
                if (dff_1) begin
                    r_ori_data_comb <= {r_data_in_dff[15:0],{2{8'hff}}};
                    r_ori_keep_comb <= {r_ori_keep_dff[1:0],2'b0}; 
                end 
                else begin
                    r_ori_data_comb <= {r_data_in_dff[15:0],w_data_in[31:16]};
                    r_ori_keep_comb <= {r_ori_keep_dff[1:0],w_keep_in[3:2]}; 
                end
            end 
            4'b0001: begin
                if (dff_1) begin
                    r_ori_data_comb <= {r_data_in_dff[7:0],{3{8'hff}}};
                    r_ori_keep_comb <= {r_ori_keep_dff[0],3'b0}; 
                end 
                else begin
                    r_ori_data_comb <= {r_data_in_dff[7:0],w_data_in[31:8]};
                    r_ori_keep_comb <= {r_ori_keep_dff[0],w_keep_in[3:1]}; 
                end
           end 
           default:  begin 
               r_ori_data_comb <= r_data_in_dff;
               r_ori_keep_comb <= r_ori_keep_dff ; 
           end 
       endcase  
    end
end
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        r_data_in_dff   <= 'd0 ;
        r_ori_keep_dff  <= 'b0 ;
    end 
    else if (w_valid_in&w_ready_in) begin
        r_data_in_dff   <= w_data_in ;
        r_ori_keep_dff  <= w_keep_in ;
    end
end

//----------------------------------------------------//
// assign
//----------------------------------------------------//
register_slices
#( 
    .payload_width                          ( DATA_WD ),
    .forward_register_slices_generate_flag  ( 0  ),
    .backward_register_slices_generate_flag ( 0  )
)original_data_channel
(
    .i_hclk            (clk     ),
    .i_hrstn           (rst_n   ),
    .i_source_valid    (valid_in),
    .i_source_payload  (data_in ),
    .i_source_keepin   (keep_in ),
    .i_source_last     (last_in ),
    .o_source_ready    (ready_in),
    .o_dest_valid      (w_valid_in),
    .o_dest_payload    (w_data_in),
    .o_dest_keepin     (w_keep_in),
    .o_dest_last       (w_last_in),
    .i_dest_ready      (w_ready_in) 
); 
assign w_ready_in = stop_pipe_line_flag ? 1'b0 : ~r_ori_keep_dff_empty_flag&&((~frame_finish_flag&&~r_frame_n) || (r_frame_n&&frame_start_flag));//||(frame_start_flag&&frame_finish_flag))  ;
register_slices
#( 
    .payload_width                          (32),
    .DATA_CNT_WD                            (DATA_BYTE_WD),
    .forward_register_slices_generate_flag  (0 ),
    .backward_register_slices_generate_flag (0 )
)header_data_channel
(
    .i_hclk                (clk             ),
    .i_hrstn               (rst_n           ),
    .i_source_valid        (valid_insert    ),
    .i_source_payload      (data_insert     ),
    .i_source_keepin       (keep_insert     ),
    .i_source_last         (  ) ,
    .i_source_cnt          (byte_insert_cnt ),
    .o_source_ready        (ready_insert    ),
    .o_dest_valid          (w_valid_insert  ),
    .o_dest_payload        (w_data_insert   ),
    .o_dest_keepin         (w_keep_insert   ),
    .o_dest_last           (  ) , 
    .o_dest_cnt            (w_byte_insert_cnt),
    .i_dest_ready          (w_ready_insert  ) 
); 


assign w_ready_insert = r_ready_insert ;
assign valid_out = r_valid_out ;
assign data_out  = r_data_comb ;
assign keep_out  = r_keep_comb ;
assign last_out  = r_last_out  || r_ori_keep_dff_empty_flag; 

assign frame_start_flag  = (w_valid_insert&&w_valid_in&&(frame_finish_flag||r_frame_n));
assign stop_pipe_line_flag = ~ready_out || ~w_valid_in;

endmodule 
