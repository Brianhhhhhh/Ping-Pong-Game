module cmp1bit(
  input 	A,				// incoming A-bit to compare
  input 	B,				// incoming B-bit to compare
  input 	AgtBi,			// bit below was greater
  input		AeqBi,			// bit below was equal
  input		AltBi,			// bit below was less
  output 	AgtBo,			// outgoing compare result
  output	AeqBo,			// outgoing compare result
  output	AltBo			// outgoing compare resul
);

  //////////////////////////////////////////
  // Declare any needed internal signals //
  ////////////////////////////////////////
logic NotA;
logic NotB;
logic AeqB; //inputs equal 
logic AgreatB, EqAndPassGt;
logic AlessB, EqandPassLt;

  ////////////////////////////////////////
  // Implement cmp1bit logic in either //
  // structural or dataflow verilog.  //
  /////////////////////////////////////
not Not1(NotA, A);
not Not2(NotB, B);

xnor And1(AeqB, A, B); //A=B
and And2(AeqBo, AeqB, AeqBi); //Input is AeqB and so in new input

and And3(AgreatB, A, NotB); 
and And4(EqAndPassGt, AgtBi, AeqB); 
or OR1(AgtBo, AgreatB , EqAndPassGt); 


and And5(AlessB, NotA, B); 
and And6(EqandPassLt, AltBi, AeqB); 
or OR2(AltBo, AlessB , EqandPassLt); 






endmodule  