//================================================================--
// Design Unit	: sn74151 (behaviour) 
//
// File Name	: sn74151.v
//
// Purpose	: SN74151
//
// Author	: Daniel Guenther, Vancouver Island University
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author	         Date	      Changes
// 1.0      Daniel Guenther   2016-11-09  Filled in wires
//================================================================--

module sn74151 (P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16); 

   input wire P4, P3, P2, P1, P15, P14, P13, P12, P7, P11, P10, P9, P8, P16;
   //         I0  I1  I2  I3  I4   I5   I6   I7   E   S0   S1   S2  GND VCC
   output reg P5;  // Z
   output wire P6; // Z_BAR

   assign P6 = ~P5;

   always @(P1, P2, P3, P4, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16) begin

      if ((P16 == 1'b 1) && (P8 == 1'b 0) &&  (P7 == 1'b 0)) begin
      
         case ({P11,P10,P9})
            3'b000: P5=P4; 
            3'b001: P5=P3;
            3'b010: P5=P2;
            3'b011: P5=P1;
            3'b100: P5=P15;
            3'b101: P5=P14;
            3'b110: P5=P13;
            3'b111: P5=P12;
         endcase 
      end
      
   end

endmodule
