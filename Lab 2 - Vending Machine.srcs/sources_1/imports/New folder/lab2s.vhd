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
    subtype StateType is std_logic_vector(3 DOWNTO 0);
    signal CurrState, NextState: StateType := "0000";
begin
    -- CombLogic updates status
    CombLogic: process(CurrState, Input)
    begin
        Permit <= CurrState(2) and not(CurrState(1)) and not(CurrState(0)) after 5.6ns;
        ReturnChange <= CurrState(3) and CurrState(2) and not(CurrState(1)) after 5.6ns;
		NextState(3) <= (not(CurrState(3)) and not(CurrState(2)) and CurrState(1) and (CurrState(0)) and Input(2) and not(Input(1)) and not(Input(0)))
					or	(not (CurrState(3)) and not (CurrState(2)) and CurrState(1) and CurrState(0) and Input(2) and Input(1) and Input(0))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and not (CurrState(0)) and Input(2) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and not (CurrState(0)) and Input(2) and Input(1) and Input(0))
					or	(not (CurrState(3)) and CurrState(2) and not (CurrState(1)) and CurrState(0) and Input(2) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and not (CurrState(1)) and CurrState(0) and Input(2) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and not (CurrState(1)) and CurrState(0) and Input(2) and Input(1) and Input(0))
					after 5.6ns;
		NextState(2) <= (not (CurrState(3)) and not (CurrState(2)) and not (CurrState(1)) and not (CurrState(0)) and Input(2) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and not (CurrState(2)) and CurrState(1) and CurrState(0) and not (Input(2)) and Input(1) and not (Input(0)))
					or	(not (CurrState(3)) and not (CurrState(2)) and CurrState(1) and CurrState(0) and Input(2) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and not (CurrState(2)) and CurrState(1) and CurrState(0) and Input(2) and Input(1) and Input(0))
					or	(not (CurrState(3)) and not (CurrState(2)) and CurrState(1) and not (CurrState(0)) and not (Input(2)) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and not (CurrState(0)) and not (Input(2)) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and not (CurrState(0)) and not (Input(2)) and not (Input(1)) and Input(0))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and not (CurrState(0)) and not (Input(2)) and Input(1) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and not (CurrState(0)) and Input(2) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and not (CurrState(0)) and Input(2) and Input(1) and Input(0))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and CurrState(0) and not (Input(2)) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and CurrState(0) and not (Input(2)) and not (Input(1)) and Input(0))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and CurrState(0) and not (Input(2)) and Input(1) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and CurrState(0) and Input(2) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and CurrState(0) and Input(2) and Input(1) and Input(0))
					or	(not (CurrState(3)) and CurrState(2) and not (CurrState(1)) and CurrState(0) and not (Input(2)) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and not (CurrState(1)) and CurrState(0) and not (Input(2)) and not (Input(1)) and Input(0))
					or	(not (CurrState(3)) and CurrState(2) and not (CurrState(1)) and CurrState(0) and not (Input(2)) and Input(1) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and not (CurrState(1)) and CurrState(0) and Input(2) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and not (CurrState(1)) and CurrState(0) and Input(2) and Input(1) and Input(0))
					after 5.6ns;
		NextState(1) <= (not (CurrState(3)) and not (CurrState(2)) and not (CurrState(1)) and not (CurrState(0)) and not (Input(2)) and Input(1) and not (Input(0)))
					or	(not (CurrState(3)) and not (CurrState(2)) and not (CurrState(1)) and CurrState(0) and not (Input(2)) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and not (CurrState(2)) and CurrState(1) and CurrState(0) and not (Input(2)) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and not (CurrState(2)) and CurrState(1) and CurrState(0) and not (Input(2)) and not (Input(1)) and Input(0))
					or	(not (CurrState(3)) and not (CurrState(2)) and CurrState(1) and CurrState(0) and not (Input(2)) and Input(1) and not (Input(0)))
					or	(not (CurrState(3)) and not (CurrState(2)) and CurrState(1) and not (CurrState(0)) and not (Input(2)) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and not (CurrState(2)) and CurrState(1) and not (CurrState(0)) and not (Input(2)) and not (Input(1)) and Input(0))
					or	(not (CurrState(3)) and not (CurrState(2)) and CurrState(1) and not (CurrState(0)) and not (Input(2)) and Input(1) and not (Input(0)))
					or	(not (CurrState(3)) and not (CurrState(2)) and CurrState(1) and not (CurrState(0)) and Input(2) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and not (CurrState(2)) and CurrState(1) and not (CurrState(0)) and Input(2) and Input(1) and Input(0))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and not (CurrState(0)) and not (Input(2)) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and not (CurrState(0)) and not (Input(2)) and not (Input(1)) and Input(0))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and CurrState(0) and not (Input(2)) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and CurrState(0) and not (Input(2)) and Input(1) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and CurrState(0) and Input(2) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and CurrState(0) and Input(2) and Input(1) and Input(0))
					after 5.6ns;
		NextState(0) <= (not (CurrState(3)) and not (CurrState(2)) and not (CurrState(1)) and not (CurrState(0)) and not (Input(2)) and not (Input(1)) and Input(0))
					or	(not (CurrState(3)) and not (CurrState(2)) and not (CurrState(1)) and CurrState(0) and not (Input(2)) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and not (CurrState(2)) and not (CurrState(1)) and CurrState(0) and not (Input(2)) and not (Input(1)) and Input(0))
					or	(not (CurrState(3)) and not (CurrState(2)) and not (CurrState(1)) and CurrState(0) and not (Input(2)) and Input(1) and not (Input(0)))
					or	(not (CurrState(3)) and not (CurrState(2)) and not (CurrState(1)) and CurrState(0) and Input(2) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and not (CurrState(2)) and not (CurrState(1)) and CurrState(0) and Input(2) and Input(1) and Input(0))
					or	(not (CurrState(3)) and not (CurrState(2)) and CurrState(1) and CurrState(0) and not (Input(2)) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and not (CurrState(2)) and CurrState(1) and CurrState(0) and not (Input(2)) and Input(1) and not (Input(0)))
					or	(not (CurrState(3)) and not (CurrState(2)) and CurrState(1) and CurrState(0) and Input(2) and Input(1) and Input(0))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and not (CurrState(0)) and not (Input(2)) and not (Input(1)) and Input(0))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and not (CurrState(0)) and Input(2) and Input(1) and Input(0))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and CurrState(0) and not (Input(2)) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and CurrState(0) and not (Input(2)) and not (Input(1)) and Input(0))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and CurrState(0) and not (Input(2)) and Input(1) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and CurrState(0) and Input(2) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and CurrState(1) and CurrState(0) and Input(2) and Input(1) and Input(0))
					or	(not (CurrState(3)) and CurrState(2) and not (CurrState(1)) and CurrState(0) and not (Input(2)) and not (Input(1)) and not (Input(0)))
					or	(not (CurrState(3)) and CurrState(2) and not (CurrState(1)) and CurrState(0) and Input(2) and Input(1) and Input(0))
					after 5.6ns;
    end process CombLogic;
    
    -- StateReg is the clock
    StateReg: process(Clk)
    begin
        if(Clk = '1' and Clk'event) then
            CurrState <= NextState after 4ns;
        end if;
    end process StateReg;    
END Structural;