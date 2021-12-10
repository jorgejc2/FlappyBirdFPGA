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


module  color_mapper ( input        [9:0] BallX, BallY, DrawX, DrawY, Ball_size, pipe1X, pipe1Y,
                         pipe2X, pipe2Y,
							pipe3X, pipe3Y,
							cloud1X, cloud1Y, 
							cloud2X, cloud2Y, 
							cloud3X, cloud3Y, 
							cloud4X, cloud4Y, 
							cloud5X, cloud5Y, 
                        input VGA_Clk, Blank, Clk, Reset,
                       output logic [7:0]  Red, Green, Blue, eightOut,
                       output logic [26:0] score,
                       input [7:0] keycode );
    assign eightOut = SCORE_data_out;
    logic ball_on, CLOUD1_on, CLOUD2_on, CLOUD3_on, CLOUD4_on, CLOUD5_on;
    
    logic [10:0] CLOUD1_size = 100;

    //logic for greenpipe1 sprite 
    logic greenpipe2_on;
    logic [10:0] greenpipe2_size_x = 50;
    logic [10:0] greenpipe2_size_y = 100;

    //logic for greenpipe1 sprite 
    logic greenpipe1_on;
    logic [10:0] greenpipe1_size_x = 50;
    logic [10:0] greenpipe1_size_y = 100;
    // assign pipe1X = pipe1X;
    // assign pipe1Y = pipe1Y;

    //logic for greenpipe1 sprite 
    logic greenpipe3_on;

    logic [10:0] greenpipe3_size_x = 50;
    logic [10:0] greenpipe3_size_y = 100;



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
    logic [10:0] SCORE1_x = 276;
    logic [10:0] SCORE1_y = 20;
    logic [10:0] SCORE1_size_x = 8 * 4 ;
    logic [10:0] SCORE1_size_y = 16 * 4;
    logic SCORE2_on;
    logic [10:0] SCORE2_x = 244;
    logic [10:0] SCORE2_y = 20;
    logic [10:0] SCORE2_size_x = 8 *4;
    logic [10:0] SCORE2_size_y = 16*4;
    logic SCORE3_on;
    logic [10:0] SCORE3_x = 212;
    logic [10:0] SCORE3_y = 20;
    logic [10:0] SCORE3_size_x = 8 *4;
    logic [10:0] SCORE3_size_y = 16*4;
    logic SCORE4_on;
    logic [10:0] SCORE4_x = 180;
    logic [10:0] SCORE4_y = 20;
    logic [10:0] SCORE4_size_x = 8 *4;
    logic [10:0] SCORE4_size_y = 16*4;
    logic SCORE5_on;
    logic [10:0] SCORE5_x = 148;
    logic [10:0] SCORE5_y = 20;
    logic [10:0] SCORE5_size_x = 8 *4;
    logic [10:0] SCORE5_size_y = 16*4;
    logic SCORE6_on;
    logic [10:0] SCORE6_x = 116;
    logic [10:0] SCORE6_y = 20;
    logic [10:0] SCORE6_size_x = 8 *4;
    logic [10:0] SCORE6_size_y = 16*4;
    logic SCORE7_on;
    logic [10:0] SCORE7_x = 84;
    logic [10:0] SCORE7_y = 20;
    logic [10:0] SCORE7_size_x = 8 *4;
    logic [10:0] SCORE7_size_y = 16*4;
    logic SCORE8_on;
    logic [10:0] SCORE8_x = 52;
    logic [10:0] SCORE8_y = 20;
    logic [10:0] SCORE8_size_x = 8 *4;
    logic [10:0] SCORE8_size_y = 16*4;
    logic SCORE9_on;
    logic [10:0] SCORE9_x = 20;
    logic [10:0] SCORE9_y = 20;
    logic [10:0] SCORE9_size_x = 8 *4;
    logic [10:0] SCORE9_size_y = 16*4;

    // logic for the GAME OVER sign
    logic GO1_on;
    logic [10:0] GO1_x = 426;
    logic [10:0] GO1_y = 220;
    logic [10:0] GO1_size_x = 8 * 4 ;
    logic [10:0] GO1_size_y = 16 * 4;
    logic GO2_on;
    logic [10:0] GO2_x = 394;
    logic [10:0] GO2_y = 220;
    logic [10:0] GO2_size_x = 8 *4;
    logic [10:0] GO2_size_y = 16*4;
    logic GO3_on;
    logic [10:0] GO3_x = 362;
    logic [10:0] GO3_y = 220;
    logic [10:0] GO3_size_x = 8 *4;
    logic [10:0] GO3_size_y = 16*4;
    logic GO4_on;
    logic [10:0] GO4_x = 330;
    logic [10:0] GO4_y = 220;
    logic [10:0] GO4_size_x = 8 *4;
    logic [10:0] GO4_size_y = 16*4;
    logic GO5_on;
    logic [10:0] GO5_x = 298;
    logic [10:0] GO5_y = 220;
    logic [10:0] GO5_size_x = 8 *4;
    logic [10:0] GO5_size_y = 16*4;
    logic GO6_on;
    logic [10:0] GO6_x = 266;
    logic [10:0] GO6_y = 220;
    logic [10:0] GO6_size_x = 8 *4;
    logic [10:0] GO6_size_y = 16*4;
    logic GO7_on;
    logic [10:0] GO7_x = 234;
    logic [10:0] GO7_y = 220;
    logic [10:0] GO7_size_x = 8 *4;
    logic [10:0] GO7_size_y = 16*4;
    logic GO8_on;
    logic [10:0] GO8_x = 202;
    logic [10:0] GO8_y = 220;
    logic [10:0] GO8_size_x = 8 *4;
    logic [10:0] GO8_size_y = 16*4;
    logic GO9_on;
    logic [10:0] GO9_x = 170;
    logic [10:0] GO9_y = 220;
    logic [10:0] GO9_size_x = 8 *4;
    logic [10:0] GO9_size_y = 16*4;

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
    logic [12:0] GP2_ra;
    logic [12:0] GP3_ra;
    logic [11:0] HEART_ra;
    logic [2:0] HEART_data_out;
    logic [10:0] SCORE_ra;
    logic [7:0] SCORE_data_out;
    logic [13:0] CLOUD_ra;
    logic [2:0] CLOUD_data_out;

    // assign FP_ra = 50*(DrawY-pipe1Y) + (DrawX-pipe1X);
    // assign FP_ra = 50*DrawY + DrawX;
    // assign pipe1X = pipe1X;
    // assign pipe1Y = pipe1Y;
    assign FP_ra = Ball_size*(DrawY-BallY) + (DrawX-BallX);
    // assign GP1_ra = greenpipe1_size_x*(DrawY-pipe1Y) + (DrawX-pipe1X);
    // assign GP2_ra = greenpipe2_size_x*(DrawY-pipe2Y) + (DrawX-pipe2X);
    // assign GP3_ra = greenpipe3_size_x*(DrawY-pipe3Y) + (DrawX-pipe3X);
    frameRAM frameRAM0 (.read_address(FP_ra), .data_Out(FP_data_out));
    greenpipe1_frameRAM greenpipe1_frameRAM0(.read_address(GP1_ra), .data_Out(GP1_data_out));
    // greenpipe1_frameRAM greenpipe1_frameRAM1(.read_address(GP2_ra), .data_Out(GP1_data_out));
    // greenpipe1_frameRAM greenpipe1_frameRAM2(.read_address(GP3_ra), .data_Out(GP1_data_out));
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
    logic [26:0] score_n;
    logic [19:0] counter, counter_n;
    logic HEART1_intact, HEART2_intact, HEART3_intact;
    always_comb begin:Ball_on_proc
    HEART_ra = 0;
    ascii = 8'h30;

    SCORE_ra = 0;
    CLOUD_ra = 0;
    GP1_ra = 0;

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
    GO1_on = 0;
    GO2_on = 0;
    GO3_on = 0;
    GO4_on = 0;
    GO5_on = 0;
    GO6_on = 0;
    GO7_on = 0;
    GO8_on = 0;
    GO9_on = 0;
    CLOUD1_on = 0;
    CLOUD2_on = 0;
    CLOUD3_on = 0;
    CLOUD4_on = 0;
    CLOUD5_on = 0;
    greenpipe1_on = 0;
    greenpipe2_on = 0;
    greenpipe3_on = 0;
    if (!HEART3_intact && DrawX >= GO1_x && DrawX < GO1_x + GO1_size_x &&
            DrawY >= GO1_y && DrawY < GO1_y + GO1_size_y)
    begin
        GO1_on = 1'b1;
        SCORE_ra = (((DrawY-GO1_y)/4)%16) + 16*(8'h52);
    end
    if (!HEART3_intact && DrawX >= GO2_x && DrawX < GO2_x + GO2_size_x &&
            DrawY >= GO2_y && DrawY < GO2_y + GO2_size_y)
    begin
        GO2_on = 1'b1;
        SCORE_ra = (((DrawY-GO2_y)/4)%16) + 16*(8'h45);
    end
    if (!HEART3_intact && DrawX >= GO3_x && DrawX < GO3_x + GO3_size_x &&
            DrawY >= GO3_y && DrawY < GO3_y + GO3_size_y)
    begin
        GO3_on = 1'b1;
        SCORE_ra = (((DrawY-GO3_y)/4)%16) + 16*(8'h56);
    end
    if (!HEART3_intact && DrawX >= GO4_x && DrawX < GO4_x + GO4_size_x &&
            DrawY >= GO4_y && DrawY < GO4_y + GO4_size_y)
    begin
        GO4_on = 1'b1;
        SCORE_ra = (((DrawY-GO4_y)/4)%16) + 16*(8'h4f);
    end
    if (!HEART3_intact && DrawX >= GO5_x && DrawX < GO5_x + GO5_size_x &&
            DrawY >= GO5_y && DrawY < GO5_y + GO5_size_y)
    begin
        GO5_on = 1'b1;
        SCORE_ra = (((DrawY-GO5_y)/4)%16);
    end
    if (!HEART3_intact && DrawX >= GO6_x && DrawX < GO6_x + GO6_size_x &&
            DrawY >= GO6_y && DrawY < GO6_y + GO6_size_y)
    begin
        GO6_on = 1'b1;
        SCORE_ra = (((DrawY-GO6_y)/4)%16) + 16*(8'h45);
    end
    if (!HEART3_intact && DrawX >= GO7_x && DrawX < GO7_x + GO7_size_x &&
            DrawY >= GO7_y && DrawY < GO7_y + GO7_size_y)
    begin
        GO7_on = 1'b1;
        SCORE_ra = (((DrawY-GO7_y)/4)%16) + 16*(8'h4d);
    end
    if (!HEART3_intact && DrawX >= GO8_x && DrawX < GO8_x + GO8_size_x &&
            DrawY >= GO8_y && DrawY < GO8_y + GO1_size_y)
    begin
        GO8_on = 1'b1;
        SCORE_ra = (((DrawY-GO8_y)/4)%16) + 16*(8'h41);
    end
    if (!HEART3_intact && DrawX >= GO9_x && DrawX < GO9_x + GO9_size_x &&
            DrawY >= GO9_y && DrawY < GO9_y + GO9_size_y)
    begin
        GO9_on = 1'b1;
        SCORE_ra = (((DrawY-GO9_y)/4)%16) + 16*(8'h47);
    end
    else if (DrawX >= pipe1X && DrawX < pipe1X + greenpipe1_size_x && 
        DrawY >= pipe1Y && DrawY < pipe1Y + greenpipe1_size_y &&
        DrawX >= BallX && DrawX < BallX + Ball_size &&
            DrawY >= BallY && DrawY < BallY + Ball_size)
    begin
        greenpipe1_on = 1'b1;
        GP1_ra = greenpipe1_size_x*(DrawY-pipe1Y) + (DrawX-pipe1X);
        ball_on = 1'b1;
        HEART1_on = 1'b0;
        HEART2_on = 1'b0;
        HEART3_on = 1'b0;
    end
    else if (DrawX >= pipe2X && DrawX < pipe2X + greenpipe2_size_x && 
        DrawY >= pipe2Y && DrawY < pipe2Y + greenpipe2_size_y &&
        DrawX >= BallX && DrawX < BallX + Ball_size &&
            DrawY >= BallY && DrawY < BallY + Ball_size)
    begin
        greenpipe2_on = 1'b1;
        GP1_ra = greenpipe2_size_x*(DrawY-pipe2Y) + (DrawX-pipe2X);
        ball_on = 1'b1;
        HEART1_on = 1'b0;
        HEART2_on = 1'b0;
        HEART3_on = 1'b0;
    end
    else if (DrawX >= pipe3X && DrawX < pipe3X + greenpipe3_size_x && 
        DrawY >= pipe3Y && DrawY < pipe3Y + greenpipe3_size_y &&
        DrawX >= BallX && DrawX < BallX + Ball_size &&
            DrawY >= BallY && DrawY < BallY + Ball_size)
    begin
        greenpipe3_on = 1'b1;
        GP1_ra = greenpipe3_size_x*(DrawY-pipe3Y) + (DrawX-pipe3X);
        ball_on = 1'b1;
        HEART1_on = 1'b0;
        HEART2_on = 1'b0;
        HEART3_on = 1'b0;
    end
    else if(DrawX >= pipe1X && DrawX < pipe1X + greenpipe1_size_x && 
        DrawY >= pipe1Y && DrawY < pipe1Y + greenpipe1_size_y)
    begin
        greenpipe1_on = 1'b1;
        GP1_ra = greenpipe1_size_x*(DrawY-pipe1Y) + (DrawX-pipe1X);
        ball_on = 1'b0;
        HEART1_on = 1'b0;
        HEART2_on = 1'b0;
        HEART3_on = 1'b0;
    end
    else if(DrawX >= pipe2X && DrawX < pipe2X + greenpipe2_size_x && 
            DrawY >= pipe2Y && DrawY < pipe2Y + greenpipe2_size_y)
    begin
        greenpipe2_on = 1'b1;
        GP1_ra = greenpipe2_size_x*(DrawY-pipe2Y) + (DrawX-pipe2X);
        ball_on = 1'b0;
        HEART1_on = 1'b0;
        HEART2_on = 1'b0;
        HEART3_on = 1'b0;
    end
    else if(DrawX >= pipe3X && DrawX < pipe3X + greenpipe3_size_x && 
            DrawY >= pipe3Y && DrawY < pipe3Y + greenpipe3_size_y)
    begin
        greenpipe3_on = 1'b1;
        GP1_ra = greenpipe3_size_x*(DrawY-pipe3Y) + (DrawX-pipe3X);
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
    else if (DrawX >= cloud1X && DrawX < cloud1X + CLOUD1_size &&
            DrawY >= cloud1Y && DrawY < cloud1Y + CLOUD1_size)
    begin
        greenpipe1_on = 1'b0;
        ball_on = 1'b0;
        HEART1_on = 1'b0;
        HEART2_on = 1'b0;
        HEART3_on = 1'b0;
        CLOUD1_on = 1'b1;
        CLOUD_ra = CLOUD1_size*(DrawY-cloud1Y) + (DrawX-cloud1X);
    end
        else if (DrawX >= cloud2X && DrawX < cloud2X + CLOUD1_size &&
            DrawY >= cloud2Y && DrawY < cloud2Y + CLOUD1_size)
    begin
        greenpipe1_on = 1'b0;
        ball_on = 1'b0;
        HEART1_on = 1'b0;
        HEART2_on = 1'b0;
        HEART3_on = 1'b0;
        CLOUD2_on = 1'b1;
        CLOUD_ra = CLOUD1_size*(DrawY-cloud2Y) + (DrawX-cloud2X);
    end
        else if (DrawX >= cloud3X && DrawX < cloud3X + CLOUD1_size &&
            DrawY >= cloud3Y && DrawY < cloud3Y + CLOUD1_size)
    begin
        greenpipe1_on = 1'b0;
        ball_on = 1'b0;
        HEART1_on = 1'b0;
        HEART2_on = 1'b0;
        HEART3_on = 1'b0;
        CLOUD3_on = 1'b1;
        CLOUD_ra = CLOUD1_size*(DrawY-cloud3Y) + (DrawX-cloud3X);
    end
        else if (DrawX >= cloud4X && DrawX < cloud4X + CLOUD1_size &&
            DrawY >= cloud4Y && DrawY < cloud4Y + CLOUD1_size)
    begin
        greenpipe1_on = 1'b0;
        ball_on = 1'b0;
        HEART1_on = 1'b0;
        HEART2_on = 1'b0;
        HEART3_on = 1'b0;
        CLOUD4_on = 1'b1;
        CLOUD_ra = CLOUD1_size*(DrawY-cloud4Y) + (DrawX-cloud4X);
    end
        else if (DrawX >= cloud5X && DrawX < cloud5X + CLOUD1_size &&
            DrawY >= cloud5Y && DrawY < cloud5Y + CLOUD1_size)
    begin
        greenpipe1_on = 1'b0;
        ball_on = 1'b0;
        HEART1_on = 1'b0;
        HEART2_on = 1'b0;
        HEART3_on = 1'b0;
        CLOUD5_on = 1'b1;
        CLOUD_ra = CLOUD1_size*(DrawY-cloud5Y) + (DrawX-cloud5X);
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
        SCORE_ra = (((DrawY-SCORE1_y)/4)%16) + 16*(score%10) + 16*ascii;
    end
    else if (DrawX >= SCORE2_x && DrawX < SCORE2_x + SCORE2_size_x &&
            DrawY >= SCORE2_y && DrawY < SCORE2_y + SCORE2_size_y)
    begin
        SCORE2_on = 1'b1;
        SCORE_ra = (((DrawY-SCORE2_y)/4)%16) + 16*((score/10)%10) + 16*ascii;
    end
    else if (DrawX >= SCORE3_x && DrawX < SCORE3_x + SCORE3_size_x &&
            DrawY >= SCORE3_y && DrawY < SCORE3_y + SCORE3_size_y)
    begin
        SCORE3_on = 1'b1;
        SCORE_ra = (((DrawY-SCORE3_y)/4)%16) + 16*((score/100)%10) + 16*ascii;
    end
    else if (DrawX >= SCORE4_x && DrawX < SCORE4_x + SCORE4_size_x &&
            DrawY >= SCORE4_y && DrawY < SCORE4_y + SCORE4_size_y)
    begin
        SCORE4_on = 1'b1;
        SCORE_ra = (((DrawY-SCORE4_y)/4)%16) + 16*((score/1000)%10) + 16*ascii;
    end
    else if (DrawX >= SCORE5_x && DrawX < SCORE5_x + SCORE5_size_x &&
            DrawY >= SCORE5_y && DrawY < SCORE5_y + SCORE5_size_y)
    begin
        SCORE5_on = 1'b1;
        SCORE_ra = (((DrawY-SCORE5_y)/4)%16) + 16*((score/10000)%10) + 16*ascii;
    end
    else if (DrawX >= SCORE6_x && DrawX < SCORE6_x + SCORE6_size_x &&
            DrawY >= SCORE6_y && DrawY < SCORE6_y + SCORE6_size_y)
    begin
        SCORE6_on = 1'b1;
        SCORE_ra = (((DrawY-SCORE6_y)/4)%16) + 16*((score/100000)%10) + 16*ascii;
    end
    else if (DrawX >= SCORE7_x && DrawX < SCORE7_x + SCORE7_size_x &&
            DrawY >= SCORE7_y && DrawY < SCORE7_y + SCORE7_size_y)
    begin
        SCORE7_on = 1'b1;
        SCORE_ra = (((DrawY-SCORE7_y)/4)%16) + 16*((score/1000000)%10) + 16*ascii;
    end
    else if (DrawX >= SCORE8_x && DrawX < SCORE8_x + SCORE8_size_x &&
            DrawY >= SCORE8_y && DrawY < SCORE8_y + SCORE8_size_y)
    begin
        SCORE8_on = 1'b1;
        SCORE_ra = (((DrawY-SCORE8_y)/4)%16) + 16*((score/10000000)%10) + 16*ascii;
    end
    else if (DrawX >= SCORE9_x && DrawX < SCORE9_x + SCORE9_size_x &&
            DrawY >= SCORE9_y && DrawY < SCORE9_y + SCORE9_size_y)
    begin
        SCORE9_on = 1'b1;
        SCORE_ra = (((DrawY-SCORE9_y)/4)%16) + 16*((score/100000000)%10) + 16*ascii;
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
        else if ((GO1_on == 1'b1)) 
        begin 
            if( SCORE_data_out[7-((DrawX - GO1_x)/4)] != 0) begin
                Red = PALETTE[1][24:16];
                Green = PALETTE[1][15:8];
                Blue = PALETTE[1][7:0];
            end
            else begin
                Red = 8'hff; 
                Green = 8'h00;
                Blue = 8'h00;
            end
        end
        else if ((GO2_on == 1'b1)) 
        begin 
            if( SCORE_data_out[7-((DrawX - GO2_x)/4)] != 0) begin
                Red = PALETTE[1][24:16];
                Green = PALETTE[1][15:8];
                Blue = PALETTE[1][7:0];
            end
            else begin
                Red = 8'hff; 
                Green = 8'h00;
                Blue = 8'h00;
            end
        end
        else if ((GO3_on == 1'b1)) 
        begin 
            if( SCORE_data_out[7-((DrawX - GO3_x)/4)] != 0) begin
                Red = PALETTE[1][24:16];
                Green = PALETTE[1][15:8];
                Blue = PALETTE[1][7:0];
            end
            else begin
                Red = 8'hff; 
                Green = 8'h00;
                Blue = 8'h00;
            end
        end
        else if ((GO4_on == 1'b1)) 
        begin 
            if( SCORE_data_out[7-((DrawX - GO4_x)/4)] != 0) begin
                Red = PALETTE[1][24:16];
                Green = PALETTE[1][15:8];
                Blue = PALETTE[1][7:0];
            end
            else begin
                Red = 8'hff; 
                Green = 8'h00;
                Blue = 8'h00;
            end
        end
        else if ((GO5_on == 1'b1)) 
        begin 
            if( SCORE_data_out[7-((DrawX - GO5_x)/4)] != 0) begin
                Red = PALETTE[1][24:16];
                Green = PALETTE[1][15:8];
                Blue = PALETTE[1][7:0];
            end
            else begin
                Red = 8'hff; 
                Green = 8'h00;
                Blue = 8'h00;
            end
        end
        else if ((GO6_on == 1'b1)) 
        begin 
            if( SCORE_data_out[7-((DrawX - GO6_x)/4)] != 0) begin
                Red = PALETTE[1][24:16];
                Green = PALETTE[1][15:8];
                Blue = PALETTE[1][7:0];
            end
            else begin
                Red = 8'hff; 
                Green = 8'h00;
                Blue = 8'h00;
            end
        end
        else if ((GO7_on == 1'b1)) 
        begin 
            if( SCORE_data_out[7-((DrawX - GO7_x)/4)] != 0) begin
                Red = PALETTE[1][24:16];
                Green = PALETTE[1][15:8];
                Blue = PALETTE[1][7:0];
            end
            else begin
                Red = 8'hff; 
                Green = 8'h00;
                Blue = 8'h00;
            end
        end
        else if ((GO8_on == 1'b1)) 
        begin 
            if( SCORE_data_out[7-((DrawX - GO8_x)/4)] != 0) begin
                Red = PALETTE[1][24:16];
                Green = PALETTE[1][15:8];
                Blue = PALETTE[1][7:0];
            end
            else begin
                Red = 8'hff; 
                Green = 8'h00;
                Blue = 8'h00;
            end
        end
        else if ((GO9_on == 1'b1)) 
        begin 
            if( SCORE_data_out[7-((DrawX - GO9_x)/4)] != 0) begin
                Red = PALETTE[1][24:16];
                Green = PALETTE[1][15:8];
                Blue = PALETTE[1][7:0];
            end
            else begin
                Red = 8'hff; 
                Green = 8'h00;
                Blue = 8'h00;
            end
        end
        else if ((ball_on == 1'b1) && (FP_data_out != 1) && (greenpipe1_on == 1'b1)) 
        begin 
            Red = PALETTE[FP_data_out][24:16];
            Green = PALETTE[FP_data_out][15:8];
            Blue = PALETTE[FP_data_out][7:0];
        end
        else if ((ball_on == 1'b1) && (FP_data_out != 1) && (greenpipe2_on == 1'b1)) 
        begin 
            Red = PALETTE[FP_data_out][24:16];
            Green = PALETTE[FP_data_out][15:8];
            Blue = PALETTE[FP_data_out][7:0];
        end
        else if ((ball_on == 1'b1) && (FP_data_out != 1) && (greenpipe3_on == 1'b1)) 
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
        else if ((CLOUD1_on == 1'b1) && CLOUD_data_out != 1) 
        begin
            Red = PALETTE[CLOUD_data_out][24:16];
            Green = PALETTE[CLOUD_data_out][15:8];
            Blue = PALETTE[CLOUD_data_out][7:0];
        end
        else if ((CLOUD2_on == 1'b1) && CLOUD_data_out != 1) 
        begin
            Red = PALETTE[CLOUD_data_out][24:16];
            Green = PALETTE[CLOUD_data_out][15:8];
            Blue = PALETTE[CLOUD_data_out][7:0];
        end
        else if ((CLOUD3_on == 1'b1) && CLOUD_data_out != 1) 
        begin
            Red = PALETTE[CLOUD_data_out][24:16];
            Green = PALETTE[CLOUD_data_out][15:8];
            Blue = PALETTE[CLOUD_data_out][7:0];
        end
        else if ((CLOUD4_on == 1'b1) && CLOUD_data_out != 1) 
        begin
            Red = PALETTE[CLOUD_data_out][24:16];
            Green = PALETTE[CLOUD_data_out][15:8];
            Blue = PALETTE[CLOUD_data_out][7:0];
        end
        else if ((CLOUD5_on == 1'b1) && CLOUD_data_out != 1) 
        begin
            Red = PALETTE[CLOUD_data_out][24:16];
            Green = PALETTE[CLOUD_data_out][15:8];
            Blue = PALETTE[CLOUD_data_out][7:0];
        end
        else if ((greenpipe1_on == 1'b1) && GP1_data_out != 1)
        begin
            Red = PALETTE[GP1_data_out][24:16];
            Green = PALETTE[GP1_data_out][15:8];
            Blue = PALETTE[GP1_data_out][7:0];
            // Red = 8'hAA;
            // Green = 8'hAA;
            // Blue = 8'hAA;
        end
        else if ((greenpipe2_on == 1'b1) && GP1_data_out != 1)
        begin
            Red =   PALETTE[GP1_data_out][24:16];
            Green = PALETTE[GP1_data_out][15:8];
            Blue =  PALETTE[GP1_data_out][7:0];
            // Red = 8'hAA;
            // Green = 8'hAA;
            // Blue = 8'hAA;
        end
        else if ((greenpipe3_on == 1'b1) && GP1_data_out != 1)
        begin
            Red =   PALETTE[GP1_data_out][24:16];
            Green = PALETTE[GP1_data_out][15:8];
            Blue =  PALETTE[GP1_data_out][7:0];
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
        else if ((SCORE1_on == 1'b1) && SCORE_data_out[7-((DrawX - SCORE1_x)/4)] != 0) 
        begin
            Red = PALETTE[1][24:16];
            Green = PALETTE[1][15:8];
            Blue = PALETTE[1][7:0];
        end       
        else if ((SCORE2_on == 1'b1) && SCORE_data_out[7-(DrawX - SCORE2_x)/4] != 0) 
        begin
            Red = PALETTE[1][24:16];
            Green = PALETTE[1][15:8];
            Blue = PALETTE[1][7:0];
        end       
        else if ((SCORE3_on == 1'b1) && SCORE_data_out[7-(DrawX - SCORE3_x)/4] != 0) 
        begin
            Red = PALETTE[1][24:16];
            Green = PALETTE[1][15:8];
            Blue = PALETTE[1][7:0];
        end       
        else if ((SCORE4_on == 1'b1) && SCORE_data_out[7-(DrawX - SCORE4_x)/4] != 0) 
        begin
            Red = PALETTE[1][24:16];
            Green = PALETTE[1][15:8];
            Blue = PALETTE[1][7:0];
        end       
        else if ((SCORE5_on == 1'b1) && SCORE_data_out[7-(DrawX - SCORE5_x)/4] != 0) 
        begin
            Red = PALETTE[1][24:16];
            Green = PALETTE[1][15:8];
            Blue = PALETTE[1][7:0];
        end       
        else if ((SCORE6_on == 1'b1) && SCORE_data_out[7-(DrawX - SCORE6_x)/4] != 0) 
        begin
            Red = PALETTE[1][24:16];
            Green = PALETTE[1][15:8];
            Blue = PALETTE[1][7:0];
        end       
        else if ((SCORE7_on == 1'b1) && SCORE_data_out[7-(DrawX - SCORE7_x)/4] != 0) 
        begin
            Red = PALETTE[1][24:16];
            Green = PALETTE[1][15:8];
            Blue = PALETTE[1][7:0];
        end       
        else if ((SCORE8_on == 1'b1) && SCORE_data_out[7-(DrawX - SCORE8_x)/4] != 0) 
        begin
            Red = PALETTE[1][24:16];
            Green = PALETTE[1][15:8];
            Blue = PALETTE[1][7:0];
        end       
        else if ((SCORE9_on == 1'b1) && SCORE_data_out[7-(DrawX - SCORE9_x)/4] != 0) 
        begin
            Red = PALETTE[1][24:16];
            Green = PALETTE[1][15:8];
            Blue = PALETTE[1][7:0];
        end       
        else if ((CLOUD1_on == 1'b1) && CLOUD_data_out != 1) 
        begin
            Red = PALETTE[CLOUD_data_out][24:16];
            Green = PALETTE[CLOUD_data_out][15:8];
            Blue = PALETTE[CLOUD_data_out][7:0];
        end
        else if ((CLOUD2_on == 1'b1) && CLOUD_data_out != 1) 
        begin
            Red = PALETTE[CLOUD_data_out][24:16];
            Green = PALETTE[CLOUD_data_out][15:8];
            Blue = PALETTE[CLOUD_data_out][7:0];
        end
        else if ((CLOUD3_on == 1'b1) && CLOUD_data_out != 1) 
        begin
            Red = PALETTE[CLOUD_data_out][24:16];
            Green = PALETTE[CLOUD_data_out][15:8];
            Blue = PALETTE[CLOUD_data_out][7:0];
        end
        else if ((CLOUD4_on == 1'b1) && CLOUD_data_out != 1) 
        begin
            Red = PALETTE[CLOUD_data_out][24:16];
            Green = PALETTE[CLOUD_data_out][15:8];
            Blue = PALETTE[CLOUD_data_out][7:0];
        end
        else if ((CLOUD5_on == 1'b1) && CLOUD_data_out != 1) 
        begin
            Red = PALETTE[CLOUD_data_out][24:16];
            Green = PALETTE[CLOUD_data_out][15:8];
            Blue = PALETTE[CLOUD_data_out][7:0];
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
         if(Reset)begin
            state <= 3'b000;
				counter <= 0;
				score <= 0;
				end
         else begin
            state <= state_n;
				counter <= counter_n;
				score <= score_n;
         end
         
    end
    always_comb begin
        if(counter == 20'hfffff && BallY > 430 && HEART3_intact) begin
            score_n = score+1;
				counter_n = 0;
				end
         else begin
				score_n = score;
             counter_n = counter + 1;
         end
        case(state)
        3'b000: begin //3 lives and no collisions
            if(((BallX + 30) < (pipe1X + greenpipe1_size_x) && (BallX + 30) > pipe1X &&
                (BallY + 30) < (pipe1Y + greenpipe1_size_y) && (BallY + 30) > pipe1Y) ||
            ((BallX + 30) < (pipe2X + greenpipe1_size_x) && (BallX + 30) > pipe2X &&
                (BallY + 30) < (pipe2Y + greenpipe1_size_y) && (BallY + 30) > pipe2Y) ||
            ((BallX + 30) < (pipe3X + greenpipe1_size_x) && (BallX + 30) > pipe3X &&
                (BallY + 30) < (pipe3Y + greenpipe1_size_y) && (BallY + 30) > pipe3Y))
            begin
                state_n = 3'b001;
            end
            else begin
                state_n = 3'b000;
            end
        end
        3'b001: begin //lost first life and middle of collision
            if(((BallX > (pipe1X + greenpipe1_size_x)) & BallX < pipe2X) ||
            ((BallX > (pipe2X + greenpipe1_size_x)) & BallX < pipe3X) ||
            (BallX > (pipe3X + greenpipe1_size_x)))
            begin
                state_n = 3'b010;
            end
            else begin
                state_n = 3'b001;
            end
        end
        3'b010: begin //2 lives and no collisions
            if(((BallX + 30) < (pipe1X + greenpipe1_size_x) && (BallX + 30) > pipe1X &&
                (BallY + 30) < (pipe1Y + greenpipe1_size_y) && (BallY + 30) > pipe1Y) ||
            ((BallX + 30) < (pipe2X + greenpipe1_size_x) && (BallX + 30) > pipe2X &&
                (BallY + 30) < (pipe2Y + greenpipe1_size_y) && (BallY + 30) > pipe2Y) ||
            ((BallX + 30) < (pipe3X + greenpipe1_size_x) && (BallX + 30) > pipe3X &&
                (BallY + 30) < (pipe3Y + greenpipe1_size_y) && (BallY + 30) > pipe3Y))
            begin
                state_n = 3'b011;
            end
            else begin
                state_n = 3'b010;
            end
        end
        3'b011: begin //lost second life and middle of collision
            if(((BallX > (pipe1X + greenpipe1_size_x)) & BallX < pipe2X) ||
            ((BallX > (pipe2X + greenpipe1_size_x)) & BallX < pipe3X) ||
            (BallX > (pipe3X + greenpipe1_size_x)))
            begin
                state_n = 3'b100;
            end
            else begin
                state_n = 3'b011;
            end
        end
        3'b100: begin //1 life and no collisions
        if(((BallX + 30) < (pipe1X + greenpipe1_size_x) && (BallX + 30) > pipe1X &&
                (BallY + 30) < (pipe1Y + greenpipe1_size_y) && (BallY + 30) > pipe1Y) ||
            ((BallX + 30) < (pipe2X + greenpipe1_size_x) && (BallX + 30) > pipe2X &&
                (BallY + 30) < (pipe2Y + greenpipe1_size_y) && (BallY + 30) > pipe2Y) ||
            ((BallX + 30) < (pipe3X + greenpipe1_size_x) && (BallX + 30) > pipe3X &&
                (BallY + 30) < (pipe3Y + greenpipe1_size_y) && (BallY + 30) > pipe3Y))    
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
