module ConditionCheck (
    input[3:0] cond, 
    input[3:0] nzcv,
    output reg condOut
  );
  

  always @ ( * ) begin
    case (cond)
        4'b0000: begin  //EQ
            if(nzcv[2] == 1)  condOut = 1;
            else condOut = 0; 
        end

        4'b0001: begin //NE
            if(nzcv[2] == 0)  condOut = 1;
            else condOut = 0; 
        end
        
        4'b0010: begin //CS
            if(nzcv[1] == 1)  condOut = 1;
            else condOut = 0; 
        end 
        
        4'b0011: begin //CC 
            if(nzcv[1] == 0)  condOut = 1;
            else condOut = 0; 
        end 
        
        4'b0100: begin //MI
            if(nzcv[3] == 1)  condOut = 1;
            else condOut = 0; 
        end 
        
        4'b0101: begin //PL
            if(nzcv[3] == 0)  condOut = 1;
            else condOut = 0; 
        end 
        
        4'b0110: begin //VS
            if(nzcv[0] == 1)  condOut = 1;
            else condOut = 0; 
        end 
        
        4'b0111: begin //VC
            if(nzcv[0] == 0)  condOut = 1;
            else condOut = 0; 
        end 
        
        4'b1000: begin //HI
            if(nzcv[1] == 1 && nzcv[2] == 0)  condOut = 1;
            else condOut = 0; 
        end 
        
        4'b1001: begin //LS
            if(nzcv[1] == 0 && nzcv[2] == 1)  condOut = 1;
            else condOut = 0; 
        end 
        
        4'b1010: begin //GE
            if(nzcv[3] == nzcv[0])  condOut = 1;
            else condOut = 0; 
        end 
        
        4'b1011: begin //LT
            if(nzcv[3] != nzcv[0])  condOut = 1;
            else condOut = 0; 
        end 
        
        4'b1100: begin //GT
            if(nzcv[2] == 0 && nzcv[3] == nzcv[0])  condOut = 1;
            else condOut = 0; 
        end 
        
        4'b1101: begin //LE
            if(nzcv[2] == 0 || nzcv[3] != nzcv[0])  condOut = 1;
            else condOut = 0; 
        end 
        
        4'b1110: begin //AL
            condOut = 1;  
        end 
        
        4'b1111: begin //reserved
            condOut = 1;
        end
    endcase
  end
endmodule
