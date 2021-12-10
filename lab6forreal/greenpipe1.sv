module  greenpipe1 ( input Reset, frame_clk,
					input [7:0] keycode,
					input [26:0] score,
               output [9:0]  BallX, BallY, BallS );
    
    logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion, Ball_Size;

	//my logic >:)
	logic [9:0] Ball_X_Pos_Next, Ball_Y_Pos_Next, Ball_X_Motion_Next, Ball_Y_Motion_Next;
	 
    parameter [9:0] Ball_X_Center=230;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=380;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis

    assign Ball_Size = 4;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
    // always_ff @ (posedge Reset or posedge frame_clk )
    // begin: Move_Ball
    //     if (Reset)  // Asynchronous Reset
    //     begin 
    //         Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
	// 			Ball_X_Motion <= 10'd0; //Ball_X_Step;
	// 			Ball_Y_Pos <= Ball_Y_Center;
	// 			Ball_X_Pos <= Ball_X_Center;
    //     end
           
    //     else 
    //     begin 
	// 			 if ( (Ball_Y_Pos + Ball_Size) >= Ball_Y_Max )  // Ball is at the bottom edge, BOUNCE!
	// 				  Ball_Y_Motion <= (~ (Ball_Y_Step) + 1'b1);  // 2's complement.
					  
	// 			 else if ( (Ball_Y_Pos - Ball_Size) <= Ball_Y_Min )  // Ball is at the top edge, BOUNCE!
	// 				  Ball_Y_Motion <= Ball_Y_Step;
					  
	// 			  else if ( (Ball_X_Pos + Ball_Size) >= Ball_X_Max )  // Ball is at the Right edge, BOUNCE!
	// 				  Ball_X_Motion <= (~ (Ball_X_Step) + 1'b1);  // 2's complement.
					  
	// 			 else if ( (Ball_X_Pos - Ball_Size) <= Ball_X_Min )  // Ball is at the Left edge, BOUNCE!
	// 				  Ball_X_Motion <= Ball_X_Step;
					  
	// 			 else 
	// 				  Ball_Y_Motion <= Ball_Y_Motion;  // Ball is somewhere in the middle, don't bounce, just keep moving
					  
				 
	// 			 case (keycode)
	// 				8'h04 : begin

	// 							Ball_X_Motion <= -1;//A
	// 							Ball_Y_Motion<= 0;
	// 						  end
					        
	// 				8'h07 : begin
								
	// 				        Ball_X_Motion <= 1;//D
	// 						  Ball_Y_Motion <= 0;
	// 						  end

							  
	// 				8'h16 : begin

	// 				        Ball_Y_Motion <= 1;//S
	// 						  Ball_X_Motion <= 0;
	// 						 end
							  
	// 				8'h1A : begin
	// 				        Ball_Y_Motion <= -1;//W
	// 						  Ball_X_Motion <= 0;
	// 						 end	  
	// 				default: ;
	// 		   endcase
				 
	// 			 Ball_Y_Pos <= (Ball_Y_Pos + Ball_Y_Motion);  // Update ball position
	// 			 Ball_X_Pos <= (Ball_X_Pos + Ball_X_Motion);

	 always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin 
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
				Ball_X_Motion <= 10'd0; //Ball_X_Step;
				Ball_Y_Pos <= Ball_Y_Center;
				Ball_X_Pos <= Ball_X_Center;
        end
        else 
		begin
			Ball_X_Motion <= Ball_X_Motion_Next;
			Ball_Y_Motion <= Ball_Y_Motion_Next;
			Ball_X_Pos <= Ball_X_Pos_Next;
			Ball_Y_Pos <= Ball_Y_Pos_Next;

		end

	end


	always_comb
        begin 
			Ball_X_Motion_Next = Ball_X_Motion;
			Ball_Y_Motion_Next = Ball_Y_Motion;
			
				//  if ( (Ball_Y_Pos + Ball_Size) >= Ball_Y_Max )  // Ball is at the bottom edge, BOUNCE!
				// 	  Ball_Y_Motion_Next = 0;  // 2's complement.
					  
				//  else if ( (Ball_Y_Pos - Ball_Size) <= Ball_Y_Min )  // Ball is at the top edge, BOUNCE!
				// 	  Ball_Y_Motion_Next = Ball_Y_Step;
					  
				//   else if ( (Ball_X_Pos + Ball_Size) >= Ball_X_Max )  // Ball is at the Right edge, BOUNCE!
				// 	  Ball_X_Motion_Next = (~ (Ball_X_Step) + 1'b1);  // 2's complement.
					  
				//  else if ( (Ball_X_Pos - Ball_Size) <= Ball_X_Min )  // Ball is at the Left edge, BOUNCE!
				// 	  Ball_X_Motion_Next = Ball_X_Step;
					  
				//  else 
				// 	  Ball_Y_Motion_Next = Ball_Y_Motion;  // Ball is somewhere in the middle, don't bounce, just keep moving
					  
				 
				 case (keycode)
					8'h04 : begin
								// if ( (Ball_X_Pos - Ball_Size) <= Ball_X_Min )
								// begin
								// 	Ball_X_Motion_Next = Ball_X_Step;
								// end
								// else begin
								Ball_X_Motion_Next = -1 - score/1000;//A
								Ball_Y_Motion_Next= 0;
								// end
								
							  end
					        
					8'h07 : begin
							if ( (Ball_X_Pos + Ball_Size) >= Ball_X_Max )
							begin
								Ball_X_Motion_Next = (~ (Ball_X_Step) + 1'b1);  
							end
							else begin
								Ball_X_Motion_Next = 1;//D
							  Ball_Y_Motion_Next = 0;
							end
					        
							  end

							  
					8'h16 : begin
							if ( (Ball_Y_Pos + Ball_Size) >= Ball_Y_Max )
							begin
							Ball_Y_Motion_Next = 0;
							end
							else begin
							Ball_Y_Motion_Next = 1;//S
							  Ball_X_Motion_Next = 0;	
							end
					        
							 end
							  
					8'h1A : begin //when game logic is done, comment out every case but this one
							if((Ball_Y_Pos - Ball_Size) <= Ball_Y_Min )
							begin
								Ball_Y_Motion_Next = Ball_Y_Step;
							
							end
							
							else begin
							Ball_Y_Motion_Next = -3;//W
							  Ball_X_Motion_Next = 0;	
							end
					        
							 end	  
					default: ;
					// begin
					// 	Ball_X_Motion_Next = Ball_X_Motion;
					// 	Ball_Y_Motion_Next = Ball_Y_Motion;
					// end
			   endcase
			if(Ball_X_Pos == 0) begin
				Ball_X_Pos_Next = Ball_X_Max + 2*(score%100);
				Ball_Y_Pos_Next = (Ball_Y_Pos + Ball_Y_Motion);  // Update ball position
			end
			else begin 
				Ball_Y_Pos_Next = (Ball_Y_Pos + Ball_Y_Motion);  // Update ball position
				Ball_X_Pos_Next = (Ball_X_Pos + Ball_X_Motion);
			end
				 
				 


	
			
			
	  /**************************************************************************************
	    ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
		 Hidden Question #2/2:
          Note that Ball_Y_Motion in the above statement may have been changed at the same clock edge
          that is causing the assignment of Ball_Y_pos.  Will the new value of Ball_Y_Motion be used,
          or the old?  How will this impact behavior of the ball during a bounce, and how might that 
          interact with a response to a keypress?  Can you fix it?  Give an answer in your Post-Lab.
      **************************************************************************************/
      
			
		end  

       
    assign BallX = Ball_X_Pos;
   
    assign BallY = Ball_Y_Pos;
   
    assign BallS = Ball_Size;
    

endmodule