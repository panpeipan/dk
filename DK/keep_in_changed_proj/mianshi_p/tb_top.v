module tb_top();
//----------------------------------------------------//
// reg
//----------------------------------------------------//
localparam  time_cyc = 20   ;
//----------------------------------------------------//
// reg
//----------------------------------------------------//
reg            r_sys_clk , r_sys_rstn;
reg            r_source_valid        ;
wire           w_source_ready        ;
reg    [31:0]  r_source_payload      ;
wire           w_dest_valid          ;
reg            r_dest_ready          ;
wire   [31:0]  w_dest_payload        ;
reg [3:0]      r_cnt_last            ;
wire           r_last_in             ; 
reg    [3:0]   r_keep_in             ;
always #(time_cyc/2) r_sys_clk = ~r_sys_clk ;
initial begin
    r_sys_clk        = 1'b1 ;
    r_sys_rstn       = 1'b1 ;
    r_source_payload = 'd0  ;
    #20 
    r_sys_rstn       = 1'd0  ; 
    #20
    r_sys_rstn       = 1'b1 ;
    #10000 
    $finish ;
end
//----------------------------------------------------//
// main_code
//----------------------------------------------------//
always @(posedge r_sys_clk or negedge r_sys_rstn) begin
    if (!r_sys_rstn) begin
        r_source_valid   <= 0 ;
    end 
    // else begin
        // r_source_valid <= 1 ;
    // end
    else if (r_source_valid && w_source_ready)begin
        r_source_valid   <= 1'b0 ;
    end  
    else if (r_source_valid == 0 ) begin
        r_source_valid   <= $random;   
    end
end 
always @(posedge r_sys_clk or negedge r_sys_rstn) begin
    if (!r_sys_rstn) begin
        r_source_payload <= {{8'h10},{8'h20},{8'h30},{8'h40}} ;
    end 
    else if (w_source_ready&r_source_valid) begin 
        if (r_last_in) begin
           // r_source_payload <= r_source_payload - {4{8'haa}} ;  
           r_source_payload <= r_source_payload -{4{8'h07}};//+ {4{8'h10}} - {4{8'h07}} ; 
        end 
        else begin 
           r_source_payload <= r_source_payload + {4{8'h01}}  ; 
        end 
    end 
    else begin
        r_source_payload <= r_source_payload ;
    end
end 
reg [4:0] cnt ;

always @(posedge r_sys_clk or negedge r_sys_rstn) begin
    if (!r_sys_rstn) begin 
        cnt  <= 0 ;
    end  
    else if (cnt==5'd7&&w_source_ready&&r_source_valid) begin
        cnt <= 0 ;
    end
    else if (w_source_ready&r_source_valid) begin
        cnt <= cnt + 1 ;
    end 
end 

always @(posedge r_sys_clk or negedge r_sys_rstn) begin
    if (!r_sys_rstn) begin
        r_dest_ready      <= 1 ;
    end 
    // else if (w_dest_valid && r_dest_ready)begin
        // r_dest_ready   <= 1'b0 ;
    // end  
    // else if (r_dest_ready == 0 ) begin
        // r_dest_ready   <= $random;   
    // end
end 
always @(posedge r_sys_clk or negedge r_sys_rstn) begin
    if (!r_sys_rstn) begin
        r_keep_in <= 4'b0111 ;
    end 
    else if(r_last_in&&w_source_ready&&r_source_valid)begin 
        r_keep_in <= 4'b1111 ;                             //TODO data keep_in         
   //TODO keep_in也是可以按插入头的形式给值，周六中午写的时候没好好看题目要求。
   //keepin headerin 和 结尾的keep，1的个数要大于等于5，功能才正常，想把这个功
   //能做得更鲁邦，可能需要花点时间。
    end  
    else if (cnt==5'd6&&w_source_ready&&r_source_valid) begin
        r_keep_in <= 4'b1000;
    end
    else if(w_source_ready&&r_source_valid)begin
        r_keep_in <= 4'b1111 ;
    end 
end 
//
assign r_last_in = (cnt == 5'd7) ;
// //----------------------------------------------------//
// // main_code
// //----------------------------------------------------//
initial begin
    $fsdbDumpfile("./tb_top.fsdb");
    $fsdbDumpvars(0,"+mda","+all");
    $fsdbDumpMDA();
end 
//----------------------------------------------------//
// assign
//----------------------------------------------------//
axi_stream_insert_header dut(
    .clk             (r_sys_clk ),
    .rst_n           (r_sys_rstn),
    // AXI Stream input original data
    .valid_in        (r_source_valid),
    .data_in         (r_source_payload),
    .keep_in         (r_keep_in),
    .last_in         (r_last_in),
    .ready_in        (w_source_ready),
    // AXI Stream output with header inserted
    .valid_out       (w_dest_valid),
    .data_out        (),
    .keep_out        (),
    .last_out        (),
    .ready_out       (r_dest_ready),
    // The header to be inserted to AXI Stream input
    .valid_insert    (1'b1),
    .data_insert     ({4{8'h55}}),                        //头数据
    .keep_insert     (4'b0111),                           //TODO head keep in
    .byte_insert_cnt (2'b11),
    .ready_insert    ()
); 

endmodule 
