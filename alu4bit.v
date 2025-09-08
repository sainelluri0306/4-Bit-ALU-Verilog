module alu4bit (
    input [3:0] a, b,
    input [2:0] alu_sel,
    output reg [3:0] alu_out,
    output reg carry,
    output reg zero
);

    wire [3:0] and_out, or_out, xor_out, add_sum, sub_diff;
    wire add_cout, sub_cout;

    // Instantiate submodules
    and_gate4 u_and (.a(a), .b(b), .y(and_out));
    or_gate4  u_or  (.a(a), .b(b), .y(or_out));
    xor_gate4 u_xor (.a(a), .b(b), .y(xor_out));
    add_4bit  u_add (.a(a), .b(b), .cin(1'b0), .s(add_sum), .cout(add_cout));
    sub_4bit  u_sub (.a(a), .b(b), .diff(sub_diff), .borrow(sub_cout));

    // Select operation
    always @(*) begin
        case (alu_sel)
            3'b000: begin alu_out = and_out; carry = 0;        end // AND
            3'b001: begin alu_out = or_out;  carry = 0;        end // OR
            3'b010: begin alu_out = xor_out; carry = 0;        end // XOR
            3'b011: begin alu_out = add_sum; carry = add_cout; end // ADD
            3'b100: begin alu_out = sub_diff; carry = sub_cout; end // SUB
            default: begin alu_out = 4'b0000; carry = 0; end
        endcase

        // Zero flag
        if (alu_out == 4'b0000)
            zero = 1;
        else
            zero = 0;
    end

endmodule
