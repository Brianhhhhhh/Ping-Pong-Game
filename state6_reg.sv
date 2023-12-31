////////////////////////////////////////////////////////////
// Forms a 6-bit state register that will be one hot.    //
// Meaning it needs to aynchronously reset to 6'b000001 //
//
//
// Author1: Brian Huang____________________
// Author2: Manav____________________
/////////////////////////////////////////////////////////
module state6_reg(
  input CLK,				// clock
  input CLRN,				// asynchronous active low reset
  input [5:0] nxt_state,	// forms next state (i.e. goes to D input of FFs)
  output [5:0] state		// output (current state)
);
  
  ////////////////////////////////////////////////////
  // Declare any needed internal signals.  Due to  //
  // all bits except LSB needed to reset, and the //
  // LSB needing to preset you will need to form //
  // two 6-bit vectors to hook to CLRN and PRN  //
  ///////////////////////////////////////////////
  logic [5:0] reset;
  logic [5:0] preset;  
  ///////////////////////////////////////////////////////////
  // The two 6-bit vectors for CLRN & PRN are formed with //
  // vector concatenation of a mix of CLRN and 1'b1      //
  ////////////////////////////////////////////////////////
 assign reset = {CLRN, CLRN, CLRN, CLRN, CLRN, 1'b1};
 assign preset = {1'b1, 1'b1, 1'b1, 1'b1, 1'b1, CLRN};
 
 
  
  ////////////////////////////////////////////////////////
  // instantiate 6 d_ff as a vector to implement state //
  //////////////////////////////////////////////////////
 d_ff d_ff_6 [5:0](.CLK({6{CLK}}),.D(nxt_state),.CLRN(reset),.PRN(preset),.Q(state));
  
endmodule