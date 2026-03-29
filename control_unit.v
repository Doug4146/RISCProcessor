`timescale 1ns/10ps
module control_unit (

	// select & encode signals
	output reg Gra, Grb, Grc, Rin, Rout, BAout, Cout, 
	// bus control
	output reg HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout,
	// enables
	output reg PCin, IRin, Yin, Zin, MDRin, MARin, HIin, LOin, CONin,
	// in + outport
	output reg Out_PortIn, 
	
	output reg Read, Write, Run, IncPC,
	
	output reg ADD, SUB, AND, OR, SHR, SHRA, SHL, ROR, ROL, DIV, MUL, NEG, NOT, MUL_start,
	
	input [31:0] IR,
	input MUL_busy, CON_val,
	input clock, clear, stop
);

	parameter [7:0]
        reset_state = 8'd0, fetch0 = 8'd1, fetch1 = 8'd2, fetch2 = 8'd3,
        
        add3 = 8'd4,  add4 = 8'd5,  add5 = 8'd6,
        sub3 = 8'd7,  sub4 = 8'd8,  sub5 = 8'd9,
        and3 = 8'd10, and4 = 8'd11, and5 = 8'd12,
        or3  = 8'd13, or4  = 8'd14, or5  = 8'd15,
        shr3 = 8'd16, shr4 = 8'd17, shr5 = 8'd18,
        shra3= 8'd19, shra4= 8'd20, shra5= 8'd21,
        shl3 = 8'd22, shl4 = 8'd23, shl5 = 8'd24,
        ror3 = 8'd25, ror4 = 8'd26, ror5 = 8'd27,
        rol3 = 8'd28, rol4 = 8'd29, rol5 = 8'd30,
        neg3 = 8'd31, neg4 = 8'd32, neg5 = 8'd33,
        not3 = 8'd34, not4 = 8'd35, not5 = 8'd36,
        
        mul3 = 8'd37, mul4 = 8'd38, mul_wait = 8'd39, mul5 = 8'd40, mul6 = 8'd41,
        div3 = 8'd42, div4 = 8'd43, div5 = 8'd44, div6 = 8'd45, 
        
        addi3 = 8'd46, addi4 = 8'd47, addi5 = 8'd48,
        andi3 = 8'd49, andi4 = 8'd50, andi5 = 8'd51,
        ori3  = 8'd52, ori4  = 8'd53, ori5  = 8'd54,

        ld3 = 8'd55, ld4 = 8'd56, ld5 = 8'd57, ld6 = 8'd58, ld7 = 8'd59,
        ldi3= 8'd60, ldi4= 8'd61, ldi5= 8'd62,
        st3 = 8'd63, st4 = 8'd64, st5 = 8'd65, st6 = 8'd66, st7 = 8'd67,

        br3 = 8'd68, br4 = 8'd69, br5 = 8'd70, br6 = 8'd71,
        jr3 = 8'd72, jal3 = 8'd73, jal4 = 8'd74,

        mfhi3 = 8'd75, mflo3 = 8'd76,
        in3 = 8'd77, out3 = 8'd78,
        
        nop3 = 8'd79, halt3 = 8'd80, decode_state = 8'd81;

    reg [7:0] present_state, next_state;
	 
	 always @(posedge clock or posedge clear) begin
        if (clear == 1'b1) 
            present_state <= reset_state;
        else if (stop == 1'b1)
            present_state <= halt3;
        else 
            present_state <= next_state;
    end
	always @(*) begin
        // defaults
        Gra = 0; Grb = 0; Grc = 0; Rin = 0; Rout = 0; BAout = 0; Cout = 0;
        HIout = 0; LOout = 0; Zhighout = 0; Zlowout = 0; PCout = 0; MDRout = 0; InPortout = 0;
        PCin = 0; IRin = 0; Yin = 0; Zin = 0; MDRin = 0; MARin = 0; HIin = 0; LOin = 0; CONin = 0;
        Read = 0; Write = 0; Out_PortIn = 0; IncPC = 0; 
        ADD = 0; SUB = 0; AND = 0; OR = 0; SHR = 0; SHRA = 0; SHL = 0; ROR = 0; ROL = 0; 
        DIV = 0; MUL = 0; NEG = 0; NOT = 0; MUL_start = 0;
        Run = 1; 

        case (present_state)
            
            reset_state: begin
                next_state = fetch0;
            end

            // fetch 
            fetch0: begin
                PCout = 1; MARin = 1; IncPC = 1; Zin = 1;
                next_state = fetch1;
            end
            fetch1: begin
                Zlowout = 1; PCin = 1; Read = 1; MDRin = 1;
                next_state = fetch2;
            end
				fetch2: begin
                MDRout = 1; IRin = 1;
                next_state = decode_state; 
            end
            decode_state: begin
                case (IR[31:27])
                    5'b00000: next_state = add3;
                    5'b00001: next_state = sub3;
                    5'b00010: next_state = and3;
                    5'b00011: next_state = or3;
                    5'b00100: next_state = shr3;
                    5'b00101: next_state = shra3;
                    5'b00110: next_state = shl3;
                    5'b00111: next_state = ror3;
                    5'b01000: next_state = rol3;
                    5'b01001: next_state = addi3;
                    5'b01010: next_state = andi3;
                    5'b01011: next_state = ori3;
                    5'b01100: next_state = div3;
                    5'b01101: next_state = mul3;
                    5'b01110: next_state = neg3;
                    5'b01111: next_state = not3;
                    5'b10000: next_state = ld3;
                    5'b10001: next_state = ldi3;
                    5'b10010: next_state = st3;
                    5'b10011: next_state = jal3;
                    5'b10100: next_state = jr3;
                    5'b10101: next_state = br3;
                    5'b10110: next_state = in3;
                    5'b10111: next_state = out3;
                    5'b11000: next_state = mfhi3;
                    5'b11001: next_state = mflo3;
                    5'b11010: next_state = nop3;
                    5'b11011: next_state = halt3;
                    default:  next_state = reset_state;
                endcase
            end
				//arithmetics
				add3: begin Grb = 1; Rout = 1; Yin = 1; next_state = add4; end
            add4: begin Grc = 1; Rout = 1; ADD = 1; Zin = 1; next_state = add5; end
            add5: begin Zlowout = 1; Gra = 1; Rin = 1; next_state = reset_state; end

            sub3: begin Grb = 1; Rout = 1; Yin = 1; next_state = sub4; end
            sub4: begin Grc = 1; Rout = 1; SUB = 1; Zin = 1; next_state = sub5; end
            sub5: begin Zlowout = 1; Gra = 1; Rin = 1; next_state = reset_state; end

            and3: begin Grb = 1; Rout = 1; Yin = 1; next_state = and4; end
            and4: begin Grc = 1; Rout = 1; AND = 1; Zin = 1; next_state = and5; end
            and5: begin Zlowout = 1; Gra = 1; Rin = 1; next_state = reset_state; end

            or3:  begin Grb = 1; Rout = 1; Yin = 1; next_state = or4; end
            or4:  begin Grc = 1; Rout = 1; OR = 1; Zin = 1; next_state = or5; end
            or5:  begin Zlowout = 1; Gra = 1; Rin = 1; next_state = reset_state; end

            shr3: begin Grb = 1; Rout = 1; Yin = 1; next_state = shr4; end
            shr4: begin Grc = 1; Rout = 1; SHR = 1; Zin = 1; next_state = shr5; end
            shr5: begin Zlowout = 1; Gra = 1; Rin = 1; next_state = reset_state; end

            shra3: begin Grb = 1; Rout = 1; Yin = 1; next_state = shra4; end
            shra4: begin Grc = 1; Rout = 1; SHRA = 1; Zin = 1; next_state = shra5; end
            shra5: begin Zlowout = 1; Gra = 1; Rin = 1; next_state = reset_state; end

            shl3: begin Grb = 1; Rout = 1; Yin = 1; next_state = shl4; end
            shl4: begin Grc = 1; Rout = 1; SHL = 1; Zin = 1; next_state = shl5; end
            shl5: begin Zlowout = 1; Gra = 1; Rin = 1; next_state = reset_state; end

            ror3: begin Grb = 1; Rout = 1; Yin = 1; next_state = ror4; end
            ror4: begin Grc = 1; Rout = 1; ROR = 1; Zin = 1; next_state = ror5; end
            ror5: begin Zlowout = 1; Gra = 1; Rin = 1; next_state = reset_state; end

            rol3: begin Grb = 1; Rout = 1; Yin = 1; next_state = rol4; end
            rol4: begin Grc = 1; Rout = 1; ROL = 1; Zin = 1; next_state = rol5; end
            rol5: begin Zlowout = 1; Gra = 1; Rin = 1; next_state = reset_state; end

            neg3: begin Grb = 1; Rout = 1; NEG = 1; Zin = 1; next_state = neg4; end
            neg4: begin Zlowout = 1; Gra = 1; Rin = 1; next_state = reset_state; end

            not3: begin Grb = 1; Rout = 1; NOT = 1; Zin = 1; next_state = not4; end
            not4: begin Zlowout = 1; Gra = 1; Rin = 1; next_state = reset_state; end

            // immediate arithmetics
            addi3: begin Grb = 1; Rout = 1; Yin = 1; next_state = addi4; end
            addi4: begin Cout = 1; ADD = 1; Zin = 1; next_state = addi5; end
            addi5: begin Zlowout = 1; Gra = 1; Rin = 1; next_state = reset_state; end

            andi3: begin Grb = 1; Rout = 1; Yin = 1; next_state = andi4; end
            andi4: begin Cout = 1; AND = 1; Zin = 1; next_state = andi5; end
            andi5: begin Zlowout = 1; Gra = 1; Rin = 1; next_state = reset_state; end

            ori3:  begin Grb = 1; Rout = 1; Yin = 1; next_state = ori4; end
            ori4:  begin Cout = 1; OR = 1; Zin = 1; next_state = ori5; end
            ori5:  begin Zlowout = 1; Gra = 1; Rin = 1; next_state = reset_state; end

            // mul and div
            mul3: begin Gra = 1; Rout = 1; Yin = 1; next_state = mul4; end
            mul4: begin Grb = 1; Rout = 1; MUL = 1; MUL_start = 1; next_state = mul_wait; end
            mul_wait: begin 
                MUL = 1; 
                if (MUL_busy == 1'b1) next_state = mul_wait;
                else begin Zin = 1; next_state = mul5; end
            end
            mul5: begin Zlowout = 1; LOin = 1; next_state = mul6; end
            mul6: begin Zhighout = 1; HIin = 1; next_state = reset_state; end

            div3: begin Gra = 1; Rout = 1; Yin = 1; next_state = div4; end
            div4: begin Grb = 1; Rout = 1; DIV = 1; Zin = 1; next_state = div5; end
            div5: begin Zlowout = 1; LOin = 1; next_state = div6; end
            div6: begin Zhighout = 1; HIin = 1; next_state = reset_state; end

            // mem
            ld3: begin Grb = 1; BAout = 1; Yin = 1; next_state = ld4; end
            ld4: begin Cout = 1; ADD = 1; Zin = 1; next_state = ld5; end
            ld5: begin Zlowout = 1; MARin = 1; next_state = ld6; end
            ld6: begin Read = 1; MDRin = 1; next_state = ld7; end
            ld7: begin MDRout = 1; Gra = 1; Rin = 1; next_state = reset_state; end

            ldi3: begin Grb = 1; BAout = 1; Yin = 1; next_state = ldi4; end
            ldi4: begin Cout = 1; ADD = 1; Zin = 1; next_state = ldi5; end
            ldi5: begin Zlowout = 1; Gra = 1; Rin = 1; next_state = reset_state; end

            st3: begin Grb = 1; BAout = 1; Yin = 1; next_state = st4; end
            st4: begin Cout = 1; ADD = 1; Zin = 1; next_state = st5; end
            st5: begin Zlowout = 1; MARin = 1; next_state = st6; end
            st6: begin Gra = 1; Rout = 1; MDRin = 1; next_state = st7; end
            st7: begin Write = 1; next_state = reset_state; end

            // branch, jump
            br3: begin Gra = 1; Rout = 1; CONin = 1; next_state = br4; end
            br4: begin PCout = 1; Yin = 1; next_state = br5; end
            br5: begin Cout = 1; ADD = 1; Zin = 1; next_state = br6; end
            br6: begin Zlowout = 1; if (CON_val == 1'b1) PCin = 1; next_state = reset_state; end

            jr3: begin Gra = 1; Rout = 1; PCin = 1; next_state = reset_state; end
            
            jal3: begin PCout = 1; Gra = 1; Rin = 1; next_state = jal4; end
				jal4: begin Grb = 1; Rout = 1; PCin = 1; next_state = reset_state; end 

            // i/o, special
            in3: begin InPortout = 1; Gra = 1; Rin = 1; next_state = reset_state; end
            out3: begin Gra = 1; Rout = 1; Out_PortIn = 1; next_state = reset_state; end
            
            mfhi3: begin HIout = 1; Gra = 1; Rin = 1; next_state = reset_state; end
            mflo3: begin LOout = 1; Gra = 1; Rin = 1; next_state = reset_state; end

            // misc
            nop3: begin next_state = reset_state; end
            halt3: begin Run = 0; next_state = halt3; end

            default: next_state = reset_state;
        endcase
    end	

endmodule
