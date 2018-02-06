----------------------------------------------------------------------
-- EECS31L/CSE31L Assignment2
-- FSM Structural Model
----------------------------------------------------------------------
-- Student First Name : Richard
-- Student Last Name : Magdaluyo
-- Student ID : 45993793
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Lab2s_FSM IS
     Port (Input : in  STD_LOGIC_VECTOR(2 DOWNTO 0);
           Clk : in  STD_LOGIC;
           Permit : out  STD_LOGIC;
           ReturnChange : out  STD_LOGIC);
END Lab2s_FSM;

ARCHITECTURE Structural OF Lab2s_FSM IS

-- DO NOT modify any signals, ports, or entities above this line
-- Create 2 processes (one for updating state status and the other for describing transitions and outputs)
-- For the combinatorial process, use Boolean equations consisting of AND, OR, and NOT gates while expressing the delay in terms of the NAND gates. 
-- For the state register process, use IF statements.
-- Figure out the appropriate sensitivity list of both the processes.
-- add your codehere
    SUBTYPE Statetype IS std_logic_vector(1 DOWNTO 0);
    CONSTANT S_Off : Statetype := "00";
    SIGNAL CurrState, NextState: Statetype;
    
    -- CombLogic updates status
    CombLogic: process(CurrState, Input)
    begin
        Permit <= ((CurrState(2) and not(CurrState(1)) and not(CurrState(0)));  
        ReturnChange <= ((CurrState(3) and CurrState(2) and not(CurrState(1))));
        NextState(3) <= 
        NextState(2) <= 
        NextState(1) <= 
        NextState(0) <=         
    end process CombLogic;
    
    -- StateReg is the clock
    StateReg: process(Clk)
    begin
        if(Clk = '1' and Clk'event) then
            CurrState <= NextState after 5.6ns;
        end if;
    end process StateReg;    
END Structural;