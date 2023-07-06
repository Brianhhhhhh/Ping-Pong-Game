/////////////////////////////////////////////
// Author1: __Brian Huang__________________
// Author2: __Manav__________________
////////////////////////////////////////////
module d_en_ff(
  input CLK,
  input D,			// D input to be flopped
  input CLRN,		// asynch active low clear (reset)
  input PRN,		// asynch active low preset (sets to 1)
  input nRST,		// synch active low reset
  input EN,			// enable signal
  output logic Q
);

  ////////////////////////////////////////////////////
  // Declare any needed internal sigals below here //
  //////////////////////////////////////////////////
	logic Dnext, and1, and2, notEN;
  
  //////////////////////////////////////////////////
  // Using structural verilog (instantiations of //
  // verilog gate primitives) form the D_next   //
  // logic necessary.                          //
  //////////////////////////////////////////////
not noEN(notEN, EN);
and log1(and1,Q,nRST,notEN);
and log2(and2,D,nRST,EN);
or func(Dnext,and1,and2);  
  //////////////////////////////////////////////
  // Instantiate simple d_ff without enable  //
  // Connect D input to logic you inferred  //
  // above.                                //
  //////////////////////////////////////////
  d_ff iDFF(.CLK(CLK),.D(Dnext),.CLRN(CLRN),.PRN(PRN),.Q(Q));

endmodule
