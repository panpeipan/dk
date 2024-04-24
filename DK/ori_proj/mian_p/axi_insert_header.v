module axi_insert_header #(
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
reg                     frame_start_flag ;
reg [DATA_WD-1:0]       dff0_data_insert ;
reg [DATA_BYTE_WD-1:0]  dff0_keep_insert ;
wire w_valid_out ;
//----------------------------------------------------//
// reg
//----------------------------------------------------//
reg                         r_frame_n                 ;
reg                         r_insert_data_comb_frame_n;

reg [DATA_WD-1:0]           r_ori_data_comb   ;
reg [DATA_BYTE_WD-1:0]      r_ori_first_keep  ;
reg [DATA_BYTE_WD-1:0]      r_keep_in         ;
reg [DATA_WD-1:0]           r_data_in_dff     ;

reg [DATA_WD-1:0]           r_data_insert     ;
reg [DATA_BYTE_WD-1:0]      r_keep_insert     ;

reg                         r_valid_out       ;

reg  [DATA_WD-1 : 0]        r_data_comb       ;

reg                         r_ready_insert    ;
//keep_out dff
reg [DATA_BYTE_WD-1:0]      r_ori_keep_comb   ;
reg [DATA_BYTE_WD-1:0]      r_ori_keep_comb_temp  ;
reg [DATA_BYTE_WD-1:0]      r_insert_keep_dff ;
reg [DATA_BYTE_WD-1:0]      r_keep_comb       ;

reg [9:0] pipe_cnt ; 
reg                         r_data_para_done_flag  ; 
reg                         r_insert_done_flag     ;
reg                         frame_finish_flag ;
reg                         r_ori_keep_dff_empty_flag ;
reg dff_3 ;
reg [DATA_BYTE_WD-1:0] r_ori_keep_ckc;
reg r_keep_dff_empty_flag ; 

reg r_last_comb ,r_pre_last ;

//-----------------------------------------//
reg [DATA_BYTE_WD-1:0]      r_ori_keep_dff ;
reg [DATA_WD-1:0]           r_ori_data_dff ;
reg                         r_ori_last_dff ;
//----------------------------------------------------//
// wire
//----------------------------------------------------//
wire                       w_valid_in       ;
wire [DATA_WD-1 : 0]       w_data_in        ;
wire [DATA_BYTE_WD-1 : 0]  w_keep_in        ;
wire                       w_last_in        ;
wire                       w_ready_in       ;
reg r_ready_in  ;
    
wire                       w_valid_insert   ;
wire  [DATA_WD-1 : 0]      w_data_insert    ;
wire  [DATA_BYTE_WD-1 : 0] w_keep_insert    ;
wire  [BYTE_CNT_WD-1 : 0]  w_byte_insert_cnt;
wire                       w_ready_insert   ;

wire                       stop_pipe_line_flag ;
wire                       w_ori_data_comb_frame_n   ; 
reg frame_start_ready_flag ;
reg                     start_fisrt_flag,keep_goon_flag; 
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        frame_start_ready_flag <= 1'b0 ;
    end 
    else if (r_ori_last_dff) begin
        frame_start_ready_flag <= 1'b0 ;
    end
    else if(valid_insert && valid_in&&!frame_start_ready_flag) begin
        frame_start_ready_flag <= 1'b1 ;
    end  
    else begin
        frame_start_ready_flag <= frame_start_ready_flag ;
    end
end 
reg frame_busy ; 
reg [1:0] busy_out_shake_cnt ;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        frame_busy <= 1'b0 ;
    end 
    else if (last_in&&valid_in&&ready_in) begin
        frame_busy <= 1'b1 ;
    end 
    else if (r_last_comb&&r_valid_out&&ready_out) begin
        frame_busy <= 1'b0 ;
    end 
    else begin
        frame_busy <= frame_busy ;
    end
end
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        busy_out_shake_cnt <= 'd0 ;
    end 
    else if (frame_busy&&r_valid_out&&ready_out) begin
        busy_out_shake_cnt <= busy_out_shake_cnt + 2'b1 ;
    end 
    else if (!frame_busy) begin
        busy_out_shake_cnt <= 'd0 ;
    end 
    else begin
        busy_out_shake_cnt <= busy_out_shake_cnt ;
    end
end 

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin 
        r_ready_in <= 1'b0 ;
    end 
    else if (frame_start_ready_flag&&valid_in&&ready_out&&!r_valid_out) begin 
        r_ready_in <= 1'b1 ;
    end 
    else if (valid_in&&r_ready_in) begin
        r_ready_in <= 1'b0 ;
    end 
    else begin
        r_ready_in <= r_ready_in ;
    end
end  

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        r_valid_out <= 1'b0 ;
    end 
    else if (frame_start_ready_flag&&valid_in&&ready_in) begin
        r_valid_out <= 1'b1 ;
    end 
    else if (r_valid_out&&ready_out&&frame_busy&&!busy_out_shake_cnt) begin
        r_valid_out <= 1'b1; 
    end
    else if (r_valid_out&&ready_out) begin
        r_valid_out <= 1'b0;
    end 
    else begin
        r_valid_out <= r_valid_out ;
    end
end


reg r_in_first_shake;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        r_in_first_shake <= 1'b0 ;
    end 
    else if (frame_start_ready_flag&&valid_in&&ready_in) begin
        r_in_first_shake <= 1'b1 ;
    end 
    else if (r_ori_last_dff&&r_valid_out&&ready_out) begin
        r_in_first_shake <= 1'b0 ;
    end 
    else begin
        r_in_first_shake <= r_in_first_shake ;
    end
end  

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        r_ready_insert <= 1'b0;
    end 
    else if (frame_start_ready_flag&&!r_in_first_shake&&valid_insert&&valid_in) begin
        r_ready_insert <= 1'b1 ;
    end 
    else if (r_ready_insert&&valid_insert) begin
        r_ready_insert <= 1'b0 ;
    end 
    else begin
        r_ready_insert <= r_ready_insert ;
    end
end


always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        r_data_insert <= 'd0 ;
        r_keep_insert <= 'd0 ;
    end 
    else if (r_ready_insert&&valid_insert) begin
        r_data_insert <= data_insert ;
        r_keep_insert <= keep_insert ;
    end 
    else begin
        r_data_insert <= r_data_insert ;
        r_keep_insert <= r_keep_insert ;
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        r_ori_keep_dff <= 'd0 ;
        r_ori_data_dff <= 'd0 ;
        r_ori_last_dff <= 'd0 ;
    end 
    else if (valid_in&&ready_in) begin
        r_ori_keep_dff <= keep_in ;
        r_ori_data_dff <= data_in ;
        r_ori_last_dff <= last_in ;
    end 
    else if (r_valid_out&&ready_out&&r_last_comb) begin
        r_ori_keep_dff <= 'd0 ;
        r_ori_data_dff <= 'd0 ;
        r_ori_last_dff <= 'd0 ;
    end
end
always@(posedge clk or negedge rst_n)begin 
    if (!rst_n) begin 
        r_data_comb <= 'd0 ;
        r_keep_comb <= 'b0 ;
        r_last_comb <= 'b0 ;
        r_pre_last  <= 1'b0;
        r_insert_done_flag <= 1'b0 ;
    end  
    else if ((r_in_first_shake&&valid_in&&ready_in)||(frame_busy&&r_valid_out&&ready_out))begin  
        if (~r_insert_done_flag) begin   //TODO 
            case (r_keep_insert) 
               4'b1111: begin 
                       r_last_comb <= 1'b0 ;
                       r_data_comb <= r_data_insert ; 
                       r_keep_comb <= r_keep_insert ; 
               end 
               4'b0111: begin  
                       r_data_comb <= {r_data_insert[23:0],data_in[31:24]} ;
                       r_keep_comb <= {r_keep_insert[2:0] ,keep_in[3]} ; 
                       r_last_comb <=  1'b0 ; 
               end 
               4'b0011: begin 
                      r_data_comb <= {r_data_insert[15:0],data_in[31:16]} ;
                      r_keep_comb <= {r_keep_insert[1:0] ,keep_in[3:2]} ; 
                      r_last_comb <=  1'b0 ; 
               end 
               4'b0001:  begin 
                      r_data_comb <= {r_data_insert[7:0],data_in[31:8]} ;
                      r_keep_comb <= {r_keep_insert[0]  ,keep_in[3:1]} ; 
                      r_last_comb <=  1'b0 ; 
               end 
               default: begin 
                   r_last_comb <= 1'b0 ;
                   r_data_comb <= r_data_insert ;
                   r_keep_comb <= r_keep_insert ; 
               end 
            endcase           
            r_insert_done_flag <= 1'b1 ;
            r_pre_last <=1'b0;
        end 
        else begin
            case (r_keep_insert) 
               4'b1111: begin 
                   r_last_comb <= r_ori_last_dff;
                   r_data_comb <= r_ori_data_dff; 
                   r_keep_comb <= r_ori_keep_dff; 
               end 
               4'b0111: begin 
                 if (r_ori_last_dff) begin
                     r_last_comb <=  r_ori_last_dff ;
                     r_data_comb <= {r_ori_data_dff[23:0],{8'hfe}};
                     r_keep_comb <= {r_ori_keep_dff[2:0] ,1'b0};
                     r_pre_last  <= 1'b0;
                 end 
                 else begin
                     r_last_comb <= r_ori_last_dff ;
                     r_data_comb <= {r_ori_data_dff[23:0],data_in[31:24]};
                     r_keep_comb <= {r_ori_keep_dff[2:0] ,keep_in[3]};
                     if (keep_in[0] == 1'b0) begin
                         r_pre_last <= 1'b1;
                     end 
                     else begin
                         r_pre_last <= 1'b0;
                     end
                 end
               end 
               4'b0011:  begin
                   if (r_ori_last_dff) begin
                       r_last_comb <= r_ori_last_dff ;
                       r_data_comb <= {r_ori_data_dff[15:0],{2{8'hfe}}};
                       r_keep_comb <= {r_ori_keep_dff[1:0] ,2'b0};   
                       r_pre_last  <=1'b0;
                   end 
                   else begin
                       r_last_comb <=  r_ori_last_dff ;
                       r_data_comb <= {r_ori_data_dff[15:0],data_in[31:16]};
                       r_keep_comb <= {r_ori_keep_dff[1:0] ,keep_in[3:2]};   
                       if (keep_in[0] == 1'b0) begin
                           r_pre_last <= 1'b1;
                       end 
                       else begin
                           r_pre_last <=1'b0;
                       end
                   end
               end 
               4'b0001:  begin 
                   if (r_ori_last_dff) begin
                       r_last_comb <=  r_ori_last_dff ;
                       r_data_comb <= {r_ori_data_dff[7:0],{3{8'hfe}}};
                       r_keep_comb <= {r_ori_keep_dff[0] ,3'b0};
                       r_pre_last  <=1'b0;
                   end 
                   else begin
                       r_last_comb <=  r_ori_last_dff ;
                       r_data_comb <= {r_ori_data_dff[7:0],data_in[31:8]};
                       r_keep_comb <= {r_ori_keep_dff[0]  ,keep_in[3:1]};   
                       if (keep_in[0] == 1'b0) begin
                           r_pre_last <= 1'b1;
                       end 
                       else begin
                           r_pre_last <= 1'b0 ;
                       end
                   end
               end
               default:  begin
                   r_last_comb <= r_ori_last_dff ;
                   r_data_comb <= r_ori_data_dff ; 
                   r_keep_comb <= r_ori_keep_dff ; 
               end 
            endcase 
            if (r_ori_last_dff) begin
                r_insert_done_flag <= 1'b0 ;
            end
        end 
    end 
end  
reg r_pre_last_work ;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        r_pre_last_work <= 1'b0 ;
    end 
    else if (r_pre_last) begin
        r_pre_last_work <= 1'b1 ;
    end 
    else if (r_valid_out&&ready_out)begin
        r_pre_last_work <= 1'b0 ;
    end 
    else begin
        r_pre_last_work <= r_pre_last_work;
    end
end
assign ready_in = !frame_busy &&r_ready_in ;
assign valid_out = r_valid_out && !r_pre_last_work;
assign last_out = r_last_comb ||r_pre_last_work ;
assign keep_out = r_keep_comb  ;
assign data_out = r_data_comb  ;
endmodule 




