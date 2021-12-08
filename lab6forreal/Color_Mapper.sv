//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input        [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
                        input VGA_Clk, Blank, Clk, Reset,
                       output logic [7:0]  Red, Green, Blue );
    
    logic ball_on;

    //for cloud sprites
    logic [9:0] CLOUD1_x, CLOUD1_y ,CLOUD1_size, CLOUD2_x, CLOUD2_y ,CLOUD2_size ,CLOUD3_x ,CLOUD3_y  ,CLOUD3_size, CLOUD4_x ,
    CLOUD4_y ,CLOUD4_size,
    CLOUD5_x ,CLOUD5_y,CLOUD5_size;
    cloudMovements cloudMovements1(.Reset(Reset), .frame_clk(VGA_Clk),
               .BallX(CLOUD1_x), .BallY(CLOUD1_y), .BallS(CLOUD1_size) );
    
    cloudMovements cloudMovements2(.Reset(Reset), .frame_clk(VGA_Clk),
               .BallX(CLOUD2_x), .BallY(CLOUD2_y), .BallS(CLOUD2_size) );

    cloudMovements cloudMovements3(.Reset(Reset), .frame_clk(VGA_Clk),
               .BallX(CLOUD3_x), .BallY(CLOUD3_y), .BallS(CLOUD3_size) );

    cloudMovements cloudMovements4(.Reset(Reset), .frame_clk(VGA_Clk),
               .BallX(CLOUD4_x), .BallY(CLOUD4_y), .BallS(CLOUD4_size) );

    cloudMovements cloudMovements5(.Reset(Reset), .frame_clk(VGA_Clk),
               .BallX(CLOUD5_x), .BallY(CLOUD5_y), .BallS(CLOUD5_size) );



    //logic for greenpipe1 sprite 
    logic greenpipe1_on;
    logic [10:0] greenpipe1_x = 300;
    logic [10:0] greenpipe1_y = 380;
    logic [10:0] greenpipe1_size_x = 50;
    logic [10:0] greenpipe1_size_y = 100;

    //logic for hearts 1-3
    logic HEART1_on;
    logic [10:0] HEART1_x = 450;
    logic [10:0] HEART1_y = 20;
    logic [10:0] HEART1_size_x = 50;
    logic [10:0] HEART1_size_y = 50;
    logic HEART2_on;
    logic [10:0] HEART2_x = 500;
    logic [10:0] HEART2_y = 20;
    logic [10:0] HEART2_size_x = 50;
    logic [10:0] HEART2_size_y = 50;
    logic HEART3_on;
    logic [10:0] HEART3_x = 550;
    logic [10:0] HEART3_y = 20;
    logic [10:0] HEART3_size_x = 50;
    logic [10:0] HEART3_size_y = 50;

    //logic for scoreboard
    logic SCORE1_on;
    logic [10:0] SCORE1_x = 20;
    logic [10:0] SCORE1_y = 20;
    logic [10:0] SCORE1_size_x = 8 ;
    logic [10:0] SCORE1_size_y = 16;
    logic SCORE2_on;
    logic [10:0] SCORE2_x = 60;
    logic [10:0] SCORE2_y = 20;
    logic [10:0] SCORE2_size_x = 8 *4;
    logic [10:0] SCORE2_size_y = 16*4;
    logic SCORE3_on;
    logic [10:0] SCORE3_x = 100;
    logic [10:0] SCORE3_y = 20;
    logic [10:0] SCORE3_size_x = 8 *4;
    logic [10:0] SCORE3_size_y = 16*4;
    logic SCORE4_on;
    logic [10:0] SCORE4_x = 140;
    logic [10:0] SCORE4_y = 20;
    logic [10:0] SCORE4_size_x = 8 *4;
    logic [10:0] SCORE4_size_y = 16*4;
    logic SCORE5_on;
    logic [10:0] SCORE5_x = 180;
    logic [10:0] SCORE5_y = 20;
    logic [10:0] SCORE5_size_x = 8 *4;
    logic [10:0] SCORE5_size_y = 16*4;
    logic SCORE6_on;
    logic [10:0] SCORE6_x = 220;
    logic [10:0] SCORE6_y = 20;
    logic [10:0] SCORE6_size_x = 8 *4;
    logic [10:0] SCORE6_size_y = 16*4;
    logic SCORE7_on;
    logic [10:0] SCORE7_x = 260;
    logic [10:0] SCORE7_y = 20;
    logic [10:0] SCORE7_size_x = 8 *4;
    logic [10:0] SCORE7_size_y = 16*4;
    logic SCORE8_on;
    logic [10:0] SCORE8_x = 300;
    logic [10:0] SCORE8_y = 20;
    logic [10:0] SCORE8_size_x = 8 *4;
    logic [10:0] SCORE8_size_y = 16*4;
    logic SCORE9_on;
    logic [10:0] SCORE9_x = 340;
    logic [10:0] SCORE9_y = 20;
    logic [10:0] SCORE9_size_x = 8 *4;
    logic [10:0] SCORE9_size_y = 16*4;

    logic [31:0] PALETTE [8];
    assign PALETTE[0] = 32'h00FF44;
    assign PALETTE[1] = 32'hFFDDEE;
    assign PALETTE[2] = 32'hCC7711;
    assign PALETTE[3] = 32'hDD00FF;
    assign PALETTE[4] = 32'h662255;
    assign PALETTE[5] = 32'h662266;
    assign PALETTE[6] = 32'h000000;
    assign PALETTE[7] = 32'haaaaaa;

    logic [11:0] FP_ra;
    logic [2:0] FP_data_out;
    logic [12:0] GP1_ra;
    logic [2:0] GP1_data_out;
    logic [11:0] HEART_ra;
    logic [2:0] HEART_data_out;
    logic [10:0] SCORE_ra;
    logic [7:0] SCORE_data_out;
    logic [13:0] CLOUD_ra;
    logic [2:0] CLOUD_data_out;

    // assign FP_ra = 50*(DrawY-greenpipe1_y) + (DrawX-greenpipe1_x);
    // assign FP_ra = 50*DrawY + DrawX;
    assign FP_ra = Ball_size*(DrawY-BallY) + (DrawX-BallX);
    assign GP1_ra = greenpipe1_size_x*(DrawY-greenpipe1_y) + (DrawX-greenpipe1_x);
    frameRAM frameRAM0 (.read_address(FP_ra), .data_Out(FP_data_out));
    greenpipe1_frameRAM greenpipe1_frameRAM0(.read_address(GP1_ra), .data_Out(GP1_data_out));
    heart_frameRAM heart_frameRAM0 (.read_address(HEART_ra), .data_Out(HEART_data_out));
    font_rom font_rom0(.addr(SCORE_ra), .data(SCORE_data_out));
    cloud_frameRAM cloud_frameRAM0(.read_address(CLOUD_ra), .data_Out(CLOUD_data_out));
	 
 /* Old Ball: Generated square box by checking if the current pixel is within a square of length
    2*Ball_Size, centered at (BallX, BallY).  Note that this requires unsigned comparisons.
	 
    if ((DrawX >= BallX - Ball_size) &&
       (DrawX <= BallX + Ball_size) &&
       (DrawY >= BallY - Ball_size) &&
       (DrawY <= BallY + Ball_size))

     New Ball: Generates (pixelated) circle by using the standard circle formula.  Note that while 
     this single line is quite powerful descriptively, it causes the synthesis tool to use up three
     of the 12 available multipliers on the chip!  Since the multiplicants are required to be signed,
	  we have to first cast them from logic to int (signed by default) before they are multiplied). */
	  
    int DistX, DistY, Size;
	 assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
    assign Size = Ball_size;
	  
    // always_comb
    // begin:Ball_on_proc
    //     if ( ( DistX*DistX + DistY*DistY) <= (Size * Size) ) 
    //         ball_on = 1'b1;
    //     else 
    //         ball_on = 1'b0;
    //  end 
    logic [5:0] ascii;
    logic HEART1_intact, HEART2_intact, HEART3_intact;
    always_comb begin:Ball_on_proc
    HEART_ra = 0;
    ascii = 0;
    SCORE_ra = 0;

    greenpipe1_on = 1'b0;
    ball_on = 1'b0;
    HEART1_on = 1'b0;
    HEART2_on = 1'b0;
    HEART3_on = 1'b0;
    SCORE1_on = 0;
    SCORE2_on = 0;
    SCORE3_on = 0;
    SCORE4_on = 0;
    SCORE5_on = 0;
    SCORE6_on = 0;
    SCORE7_on = 0;
    SCORE8_on = 0;
    SCORE9_on = 0;
    if (DrawX >= greenpipe1_x && DrawX < greenpipe1_x + greenpipe1_size_x && 
        DrawY >= greenpipe1_y && DrawY < greenpipe1_y + greenpipe1_size_y &&
        DrawX >= BallX && DrawX < BallX + Ball_size &&
            DrawY >= BallY && DrawY < BallY + Ball_size)
    begin
        greenpipe1_on = 1'b1;
        ball_on = 1'b1;
        HEART1_on = 1'b0;
        HEART2_on = 1'b0;
        HEART3_on = 1'b0;
    end
    else if(DrawX >= greenpipe1_x && DrawX < greenpipe1_x + greenpipe1_size_x && 
        DrawY >= greenpipe1_y && DrawY < greenpipe1_y + greenpipe1_size_y)
    begin
        greenpipe1_on = 1'b1;
        ball_on = 1'b0;
        HEART1_on = 1'b0;
        HEART2_on = 1'b0;
        HEART3_on = 1'b0;
    end
    else if (DrawX >= BallX && DrawX < BallX + Ball_size &&
            DrawY >= BallY && DrawY < BallY + Ball_size)
    begin
        greenpipe1_on = 1'b0;
        ball_on = 1'b1;
        HEART1_on = 1'b0;
        HEART2_on = 1'b0;
        HEART3_on = 1'b0;
    end
    else if (DrawX >= HEART1_x && DrawX < HEART1_x + HEART1_size_x &&
            DrawY >= HEART1_y && DrawY < HEART1_y + HEART1_size_y)
    begin
        greenpipe1_on = 1'b0;
        ball_on = 1'b0;
        if(HEART1_intact) begin
        HEART1_on = 1'b1; 
        end
        else begin
            HEART1_on = 1'b0;
        end
        HEART2_on = 1'b0;
        HEART3_on = 1'b0;
        HEART_ra = HEART1_size_x*(DrawY-HEART1_y) + (DrawX-HEART1_x);
    end
    else if (DrawX >= HEART2_x && DrawX < HEART2_x + HEART2_size_x &&
            DrawY >= HEART2_y && DrawY < HEART2_y + HEART2_size_y)
    begin
        greenpipe1_on = 1'b0;
        ball_on = 1'b0;
        HEART1_on = 1'b0;
        if(HEART2_intact) begin
        HEART2_on = 1'b1;
        end
        else begin
            HEART2_on = 1'b0;
        end
        HEART3_on = 1'b0;
        HEART_ra = HEART2_size_x*(DrawY-HEART2_y) + (DrawX-HEART2_x);
    end
    else if (DrawX >= HEART3_x && DrawX < HEART3_x + HEART3_size_x &&
            DrawY >= HEART3_y && DrawY < HEART3_y + HEART3_size_y)
    begin
        greenpipe1_on = 1'b0;
        ball_on = 1'b0;
        HEART1_on = 1'b0;
        HEART2_on = 1'b0;
        if(HEART3_intact) begin
        HEART3_on = 1'b1;
        end
        else begin
            HEART3_on = 1'b0;
        end
        HEART_ra = HEART3_size_x*(DrawY-HEART3_y) + (DrawX-HEART3_x);
    end
    else if (DrawX >= SCORE1_x && DrawX < SCORE1_x + SCORE1_size_x &&
            DrawY >= SCORE1_y && DrawY < SCORE1_y + SCORE1_size_y)
    begin
        SCORE1_on = 1'b1;
        // SCORE_ra = ((SCORE1_size_x)/4)*((DrawY-SCORE1_y + 16*ascii)/4) + ((DrawX-SCORE1_x)/4);
        SCORE_ra = 3;//(((DrawY-SCORE1_y)) + 16*ascii);
    end
    else if (DrawX >= SCORE2_x && DrawX < SCORE2_x + SCORE1_size_x &&
            DrawY >= SCORE2_y && DrawY < SCORE2_y + SCORE1_size_y)
    begin
        SCORE2_on = 1'b1;
        SCORE_ra = ((SCORE1_size_x)/4)*(DrawY-SCORE2_y + 16*ascii) + (DrawX-SCORE2_x);
    end
    else if (DrawX >= SCORE3_x && DrawX < SCORE3_x + SCORE1_size_x &&
            DrawY >= SCORE3_y && DrawY < SCORE3_y + SCORE1_size_y)
    begin
        SCORE3_on = 1'b1;
        SCORE_ra = ((SCORE1_size_x)/4)*(DrawY-SCORE3_y + 16*ascii) + (DrawX-SCORE3_x);
    end
    else if (DrawX >= SCORE4_x && DrawX < SCORE4_x + SCORE1_size_x &&
            DrawY >= SCORE4_y && DrawY < SCORE4_y + SCORE1_size_y)
    begin
        SCORE4_on = 1'b1;
        SCORE_ra = ((SCORE1_size_x)/4)*(DrawY-SCORE4_y + 16*ascii) + (DrawX-SCORE4_x);
    end
    else if (DrawX >= SCORE5_x && DrawX < SCORE5_x + SCORE1_size_x &&
            DrawY >= SCORE5_y && DrawY < SCORE5_y + SCORE1_size_y)
    begin
        SCORE5_on = 1'b1;
        SCORE_ra = ((SCORE1_size_x)/4)*(DrawY-SCORE5_y + 16*ascii) + (DrawX-SCORE5_x);
    end
    else if (DrawX >= SCORE6_x && DrawX < SCORE6_x + SCORE1_size_x &&
            DrawY >= SCORE6_y && DrawY < SCORE6_y + SCORE1_size_y)
    begin
        SCORE6_on = 1'b1;
        SCORE_ra = ((SCORE1_size_x)/4)*(DrawY-SCORE6_y + 16*ascii) + (DrawX-SCORE6_x);
    end
    else if (DrawX >= SCORE7_x && DrawX < SCORE7_x + SCORE1_size_x &&
            DrawY >= SCORE7_y && DrawY < SCORE7_y + SCORE1_size_y)
    begin
        SCORE7_on = 1'b1;
        SCORE_ra = ((SCORE1_size_x)/4)*(DrawY-SCORE7_y + 16*ascii) + (DrawX-SCORE7_x);
    end
    else if (DrawX >= SCORE8_x && DrawX < SCORE8_x + SCORE1_size_x &&
            DrawY >= SCORE8_y && DrawY < SCORE8_y + SCORE1_size_y)
    begin
        SCORE8_on = 1'b1;
        SCORE_ra = ((SCORE1_size_x)/4)*(DrawY-SCORE8_y + 16*ascii) + (DrawX-SCORE8_x);
    end
    else if (DrawX >= SCORE9_x && DrawX < SCORE9_x + SCORE1_size_x &&
            DrawY >= SCORE9_y && DrawY < SCORE9_y + SCORE1_size_y)
    begin
        SCORE9_on = 1'b1;
        SCORE_ra = ((SCORE1_size_x)/4)*(DrawY-SCORE9_y + 16*ascii) + (DrawX-SCORE9_x);
    end
    else begin
        greenpipe1_on = 1'b0;
        ball_on = 1'b0;
        HEART1_on = 1'b0;
        HEART2_on = 1'b0;
        HEART3_on = 1'b0;
        SCORE1_on = 0;
        SCORE2_on = 0;
        SCORE3_on = 0;
        SCORE4_on = 0;
        SCORE5_on = 0;
        SCORE6_on = 0;
        SCORE7_on = 0;
        SCORE8_on = 0;
        SCORE9_on = 0;
    end
    end
    
    // logic [3:0] Red,Green,Blue;
    // always_ff @(posedge VGA_Clk)begin
    //     Red <= Red;
    //     Green <= Green;
    //     Blue <= Blue;
    // end
    logic[2:0] score_pos;
    always_comb
    begin:RGB_Display
        score_pos = (DrawX - SCORE1_x);
        if(!Blank) begin
            Red = 4'b0000;
            Green = 4'b0000;
            Blue = 4'b0000;
        end
        // else if (DrawX < 50 && DrawY < 50)begin
        //     Red = PALETTE[FP_data_out][24:16];
        //     Green = PALETTE[FP_data_out][15:8];
        //     Blue = PALETTE[FP_data_out][7:0];
        // end
        
        else if ((ball_on == 1'b1) && (FP_data_out != 1) && (greenpipe1_on == 1'b1)) 
        begin 
            Red = PALETTE[FP_data_out][24:16];
            Green = PALETTE[FP_data_out][15:8];
            Blue = PALETTE[FP_data_out][7:0];
        end
        else if ((ball_on == 1'b1) && FP_data_out != 1) 
        begin
            Red = PALETTE[FP_data_out][24:16];
            Green = PALETTE[FP_data_out][15:8];
            Blue = PALETTE[FP_data_out][7:0];
        end
        else if (greenpipe1_on == 1'b1 && GP1_data_out != 1)
        begin
            Red = PALETTE[GP1_data_out][24:16];
            Green = PALETTE[GP1_data_out][15:8];
            Blue = PALETTE[GP1_data_out][7:0];
            // Red = 8'hAA;
            // Green = 8'hAA;
            // Blue = 8'hAA;
        end
        else if ((HEART1_on == 1'b1) && HEART_data_out != 1) 
        begin
            Red = PALETTE[HEART_data_out][24:16];
            Green = PALETTE[HEART_data_out][15:8];
            Blue = PALETTE[HEART_data_out][7:0];
        end
        else if ((HEART2_on == 1'b1) && HEART_data_out != 1) 
        begin
            Red = PALETTE[HEART_data_out][24:16];
            Green = PALETTE[HEART_data_out][15:8];
            Blue = PALETTE[HEART_data_out][7:0];
        end
        else if ((HEART3_on == 1'b1) && HEART_data_out != 1) 
        begin
            Red = PALETTE[HEART_data_out][24:16];
            Green = PALETTE[HEART_data_out][15:8];
            Blue = PALETTE[HEART_data_out][7:0];
        end       
        else if ((SCORE1_on == 1'b1) && SCORE_data_out[DrawX - SCORE1_x] != 0) 
        begin
            Red = PALETTE[5][24:16];
            Green = PALETTE[5][15:8];
            Blue = PALETTE[5][7:0];
        end       
        else if ((SCORE2_on == 1'b1) && SCORE_data_out != 0) 
        begin
            Red = PALETTE[1][24:16];
            Green = PALETTE[1][15:8];
            Blue = PALETTE[1][7:0];
        end       
        else if ((SCORE3_on == 1'b1) && SCORE_data_out != 0) 
        begin
            Red = PALETTE[1][24:16];
            Green = PALETTE[1][15:8];
            Blue = PALETTE[1][7:0];
        end       
        else if ((SCORE4_on == 1'b1) && SCORE_data_out != 0) 
        begin
            Red = PALETTE[1][24:16];
            Green = PALETTE[1][15:8];
            Blue = PALETTE[1][7:0];
        end       
        else if ((SCORE5_on == 1'b1) && SCORE_data_out != 0) 
        begin
            Red = PALETTE[1][24:16];
            Green = PALETTE[1][15:8];
            Blue = PALETTE[1][7:0];
        end       
        else if ((SCORE6_on == 1'b1) && SCORE_data_out != 0) 
        begin
            Red = PALETTE[1][24:16];
            Green = PALETTE[1][15:8];
            Blue = PALETTE[1][7:0];
        end       
        else if ((SCORE7_on == 1'b1) && SCORE_data_out != 0) 
        begin
            Red = PALETTE[1][24:16];
            Green = PALETTE[1][15:8];
            Blue = PALETTE[1][7:0];
        end       
        else if ((SCORE8_on == 1'b1) && SCORE_data_out != 0) 
        begin
            Red = PALETTE[1][24:16];
            Green = PALETTE[1][15:8];
            Blue = PALETTE[1][7:0];
        end       
        else if ((SCORE9_on == 1'b1) && SCORE_data_out != 0) 
        begin
            Red = PALETTE[2][24:16];
            Green = PALETTE[2][15:8];
            Blue = PALETTE[2][7:0];
        end       
        else if (SCORE1_on | SCORE2_on | SCORE3_on | SCORE4_on | SCORE5_on | SCORE6_on | SCORE7_on | SCORE8_on | SCORE9_on)
        begin
            Red = 8'h00;
            Green = 8'hff;
            Blue = 8'hff;
        end
        else
        begin 
            Red = 8'h00; 
            Green = 8'h00;
            Blue = 8'hff;// - DrawX[9:3];
        end      
    end 

    logic [3:0] state, state_n;
    always_ff@(posedge Clk or posedge Reset) begin
         if(Reset)
            state <= 3'b000;
         else begin
            state <= state_n;
         end
    end
    always_comb begin
        case(state)
        3'b000: begin //3 lives and no collisions
            if((BallX + 30) < (greenpipe1_x + greenpipe1_size_x) && (BallX + 30) > greenpipe1_x &&
                (BallY + 30) < (greenpipe1_y + greenpipe1_size_y) && (BallY + 30) > greenpipe1_y)
            begin
                state_n = 3'b001;
            end
            else begin
                state_n = 3'b000;
            end
        end
        3'b001: begin //lost first life and middle of collision
            if(BallX > (greenpipe1_x + greenpipe1_size_x))begin
                state_n = 3'b010;
            end
            else begin
                state_n = 3'b001;
            end
        end
        3'b010: begin //2 lives and no collisions
            if((BallX + 30) < (greenpipe1_x + greenpipe1_size_x) && (BallX + 30) > greenpipe1_x &&
                (BallY + 30) < (greenpipe1_y + greenpipe1_size_y) && (BallY + 30) > greenpipe1_y)
            begin
                state_n = 3'b011;
            end
            else begin
                state_n = 3'b011;
            end
        end
        3'b011: begin //lost second life and middle of collision
            if(BallX > (greenpipe1_x + greenpipe1_size_x))begin
                state_n = 3'b100;
            end
            else begin
                state_n = 3'b011;
            end
        end
        3'b100: begin //1 life and no collisions
        if((BallX + 30) < (greenpipe1_x + greenpipe1_size_x) && (BallX + 30) > greenpipe1_x &&
                (BallY + 30) < (greenpipe1_y + greenpipe1_size_y) && (BallY + 30) > greenpipe1_y)
            begin
                state_n = 3'b101;
            end
            else begin
                state_n = 3'b100;
            end
        end
        3'b101: begin //no lives
            state_n = 3'b101;
        end
        default: state_n = 3'b000;
        endcase
            
        case(state)
        3'b000: begin //3 lives and no collisions
            HEART1_intact = 1'b1;
            HEART2_intact = 1'b1;
            HEART3_intact = 1'b1;
        end
        3'b001: begin //lost first life and middle of collision
            HEART1_intact = 1'b0;
            HEART2_intact = 1'b1;
            HEART3_intact = 1'b1;
        end
        3'b010: begin //2 lives and no collisions
            HEART1_intact = 1'b0;
            HEART2_intact = 1'b1;
            HEART3_intact = 1'b1;
        end
        3'b011: begin //lost second life and middle of collision
            HEART1_intact = 1'b0;
            HEART2_intact = 1'b0;
            HEART3_intact = 1'b1;
        end
        3'b100: begin //1 life and no collisions
            HEART1_intact = 1'b0;
            HEART2_intact = 1'b0;
            HEART3_intact = 1'b1;
        end
        3'b101: begin //no lives
            HEART1_intact = 1'b0;
            HEART2_intact = 1'b0;
            HEART3_intact = 1'b0;
        end
        default: begin
            HEART1_intact = 1'b1;
            HEART2_intact = 1'b1;
            HEART3_intact = 1'b1;
        end
        endcase

    end 
    
endmodule
