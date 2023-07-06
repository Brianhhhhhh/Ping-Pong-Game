module PWM (
  input CLK,			// system clock
  input CLRN,			// asynch active low reset
  input [15:0] DUTY,	// the desired duty cycle of the PWM
  output PWM			// PWM signal
);

  //////////////////////////////////////////
  // Declare any needed internal signals //
  ////////////////////////////////////////
logic [15:0] C; 
logic full, AgtB, AeqB, AltB;
  
  //////////////////////////
  // Instantiate counter //
  ////////////////////////
cnt16 iCNT (.CLK(CLK), .CLRN(CLRN), .Q(C), .full(full));
  
  //////////////////////////////////////////////
  // Instantiate 16-bit magnitude comparator //
  ////////////////////////////////////////////
mag16 MAG (.A(DUTY[15:0]), .B(C), .AgtB(AgtB), .AeqB(AeqB), .AltB(AltB));
  
  //////////////////////////////////////////
  // Instantiate d_ff to register output //
  ////////////////////////////////////////
d_ff FF(.CLK(CLK), .D(AgtB), .CLRN(CLRN), .PRN(1'b1), .Q(PWM));
  
endmodule
  