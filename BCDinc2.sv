module BCDinc2(
  input 	[7:0] A,		// BCD number to be incremented (or not)
  input 	INC,			// When asserted increment the 2-digit BCD number A[7:0]
  output	[7:0] S		// Resulting BCD digit
);

  //////////////////////////////////////////
  // Declare any needed internal signals //
  ////////////////////////////////////////
  logic adrout1, adrout2;
  
  /////////////////////////////////////////////////////////
  // Instantiate two instances of BCDinc & interconnect //
  ///////////////////////////////////////////////////////
  BCDinc adder1(.A(A[3:0]), .Cin(INC), .Cout(adrout1), .S(S[3:0]));
  BCDinc adder2(.A(A[7:4]), .Cin(adrout1), .Cout(adrout2), .S(S[7:4]));
  

endmodule  