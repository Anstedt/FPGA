module led_io_control(
    input sys_clk,          // clk input
    input btn_A,
    // input btn_B,
    // led's are turned on by setting to 1'b0
    // NOTE led[5] is on left
    output reg [5:0] led
);

reg [23:0] counter;
reg mygo_right;

always @(posedge sys_clk or negedge btn_A) begin
    if (!btn_A)
        counter <= 24'd0;
    else if (counter < 24'd1349_9999)       // 0.5s delay
        counter <= counter + 1'd1;
    else
        counter <= 24'd0;
end

always @(posedge sys_clk or negedge btn_A) begin
    if (!btn_A)
        begin
            led <= 6'b111110;
            mygo_right = 0;
        end
    else if (counter == 24'd1349_9999)       // 0.5s delay
        begin
            if (led[5] == 0 && mygo_right == 0)
            begin
                mygo_right = 1;
                led <= 6'b011111;
            end
        else if (led[0] == 0 && mygo_right == 1)
            begin
                mygo_right = 0;
                led <= 6'b111110;
            end
        if (mygo_right == 1)
            led[5:0] <= {led[0], led[5], led[4], led[3], led[2], led[1]}; // Right
        else
            led[5:0] <= {led[4], led[3], led[2], led[1], led[0], led[5]}; // Left
        end
    else
        led <= led;

end

endmodule