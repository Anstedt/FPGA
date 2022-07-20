module led_io_control(
    input btn_A,
    input btn_B,
    output led[5:0]
);

assign led[0] = btn_A;
assign led[1] = btn_B;

endmodule