

// Code your design for transmission gate

module transmissiongate(y,control,a);
  
	output y;
	input a,control;
	
	wire cbar;
	
	assign cbar = ~control;
	
	nmos n1(y,a,control);
	pmos p1(y,a,cbar);
	//cmos c1(y,a,control,cbar);	
  
endmodule
