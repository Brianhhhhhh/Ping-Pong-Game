module bcd7seg(
  input 	[3:0] num,		// BCD number to display
  input 	dis,			// when high disables all segment outputs
  output	[6:0] seg		// seg[0]=A, seg[1]=B, ...
);

  /////////////////////////////////////////////////////////
  // Declare any needed internal signals (like seg_int) //
  ///////////////////////////////////////////////////////
  logic seg_intA,seg_intB,seg_intC,seg_intD,seg_intE,seg_intF,seg_intG;

  
  ////////////////////////////////////////
  // Instantiate the 7 segment drivers //
  //////////////////////////////////////
  segAdec Adec(.D(num), .segA(seg_intA));
  segBdec Bdec(.D(num), .segB(seg_intB));
  segCdec Cdec(.D(num), .segC(seg_intC));
  segDdec Ddec(.D(num), .segD(seg_intD));
  segEdec Edec(.D(num), .segE(seg_intE));
  segFdec Fdec(.D(num), .segF(seg_intF));
  segGdec Gdec(.D(num), .segG(seg_intG));

  //////////////////////////////////////////
  // Using a dataflow (assign statement) //
  // infer the disable logic.           //
  ///////////////////////////////////////
  assign seg[6:0] = (dis == 1) ? 7'h7F : {seg_intG,seg_intF,seg_intE,seg_intD,seg_intC,seg_intB,seg_intA};
	


endmodule  