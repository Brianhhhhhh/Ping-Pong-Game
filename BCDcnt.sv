/////////////////////////////////////////////
// Author1: _Brian Huang___________________
// Author2: __Manav__________________
////////////////////////////////////////////
module BCDcnt(
  input 	CLK,		// system clock
  input 	CLRN,		// asynch clears count
  input 	CLR_CNT,	// synchronously clears count
  input 	INC,		// When asserted increment the 2-digit BCD number
  output	[7:0] CNT	// [7:4] represent upper digit [3:0] lower digit of count
);

  //////////////////////////////////////////
  // Declare any needed internal signals //
  ////////////////////////////////////////
  logic notCLR_CNT,EN;
  logic [7:0] D;


  
  /////////////////////////////////////////////
  // Do you need to instantiate a not gate? //
  ///////////////////////////////////////////
 not noCLR_CNT(notCLR_CNT, CLR_CNT);
 and andEN(EN,INC,notCLR_CNT);
 
  
  /////////////////////////////////////////////////////
  // Instantiate instance of BCDinc2 & interconnect //
  ///////////////////////////////////////////////////
  BCDinc2 iINC(.A(CNT), .INC(INC), .S(D));

  //////////////////////////////////////////////////////////
  // Instantiate 8-copies of d_en_ff & interconnect      //
  // NOTE: to receive full credit you must use vectored //
  // instantiation (not 8 individual instances).       //
  //////////////////////////////////////////////////////
d_en_ff func [7:0] (.CLK({8{CLK}}), .D(D), .CLRN({8{CLRN}}), .PRN({8{1'b1}}), .nRST({8{notCLR_CNT}}), .EN({8{EN}}), .Q(CNT));  

endmodule  