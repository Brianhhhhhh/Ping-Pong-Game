module segFdec
(
	input [3:0] D,
	output segF
);

  //////////////////////////////////////////
  // Declare any needed internal signals //
  ////////////////////////////////////////
  logic na32, notD3, notD2, notD0;
  logic mt1, mt2, mt3, mt4;
  //////////////////////////////////////////////////////
  // Write STRUCTURAL verilog to implement segment F //
  ////////////////////////////////////////////////////
  not NOTD3(notD3, D[3]);
  not NOTD2(notD2, D[2]);
  not NOTD0(notD0, D[0]);
  and N3AND2(na32,notD3,notD2);
  and AND10(mt3,D[1],D[0]);
  and ANDmt1(mt1,na32,D[0]);
  and ANDmt2(mt2,na32,D[1]);
  and ANDmt3(mt4,D[3],D[2],notD0);
  or  ORmt(segF,mt1,mt2,mt3,mt4);
  
  endmodule

