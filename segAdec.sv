module segAdec
(
	input [3:0] D,
	output segA
);

  //////////////////////////////////////////
  // Declare any needed internal signals //
  ////////////////////////////////////////
  logic notD3, notD2, notD1, notD0;
  logic mt1, mt2, mt3;

  //////////////////////////////////////////////////////
  // Write STRUCTURAL verilog to implement segment A //
  ////////////////////////////////////////////////////
  not NOTD3(notD3, D[3]);
  not NOTD2(notD2, D[2]);
  not NOTD1(notD1, D[1]);
  not NOTD0(notD0, D[0]);
  and ANDmt1(mt1,D[2],notD0);
  and ANDmt2(mt2,D[3],D[1],D[0]);
  and ANDmt3(mt3,notD3,notD2,notD1,D[0]);
  or  ORmt(segA,mt1,mt2,mt3);

  
  endmodule

