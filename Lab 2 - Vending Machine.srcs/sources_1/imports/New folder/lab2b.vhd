----------------------------------------------------------------------
-- EECS31L/CSE31L Assignment2
-- FSM Behavioral Model
----------------------------------------------------------------------
-- Student First Name : Your First Name
-- Student Last Name : Your Last Name
-- Student ID : Your Student ID
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

entity Lab2b_FSM is
    Port ( Input : in  STD_LOGIC_VECTOR(2 DOWNTO 0);
           Clk : in  STD_LOGIC;
           Permit : out  STD_LOGIC;
           ReturnChange : out  STD_LOGIC);
end Lab2b_FSM;

architecture Behavioral of Lab2b_FSM is

-- DO NOT modify any signals, ports, or entities above this line
-- Create 2 processes (one for updating state status and the other for describing transitions and outputs)
-- Figure out the appropriate sensitivity list of both the processes.
-- Use CASE statements and IF/ELSE/ELSIF statements to describe your processes.
-- add your code here
    type StateType is
        (Start, FiveRCV, TenRCV, FifteenRCV, TwentyRCV, OverTwentyRCV, FiveTotal, TenTotal, FifteenTotal, TwentyTotal, OverTwentyTotal, Cancel);
    signal CurrState, NextState: StateType;
    
    begin
        -- Creates a process sensitive to Clk that serves as a clock
        StateReg: process(Clk)
        begin 
            if(Clk = '1' and Clk'event) then
                    CurrState <= NextState;
            end if;
        end process;    
        
        -- Creates a process sensitive to input and decides on what to output based 
        -- on current state and input
        CombLogic: process(CurrState, Input)
        begin
--            CurrState <= Start;
            case CurrState is
                when Start =>
                    Permit <= '0';
                    ReturnChange <= '0';
                    if(Input = "000") then
                        NextState <= Start;
                    elsif(Input = "001") then
                        NextState <= FiveRCV;
                    elsif(Input = "010") then
                        NextState <= TenRCV;
                    elsif(Input <= "100") then
                        NextState <= TwentyRCV;
                    elsif(Input <= "111") then
                        NextState <= Cancel;
                    end if;
                when FiveRCV =>
                    if(Input <= "111") then
                        NextState <= Cancel;
                    else 
                        NextState <= FiveTotal;
                    end if;
                when FiveTotal =>
                    Permit <= '0';
                    ReturnChange <= '0';
                    if(Input = "000") then
                        NextState <= FiveRCV;
                    elsif(Input = "001") then
                        NextState <= TenRCV;
                    elsif(Input = "010") then
                        NextState <= FifteenRCV;
                    elsif(Input = "100") then
                        NextState <= OverTwentyRCV;
                    elsif(Input = "111") then
                        NextState <= Cancel;
                    end if;
                when TenRCV =>
                    if(Input <= "111") then
                        NextState <= Cancel;
                    else
                        NextState <= TenTotal;
                    end if;
                when TenTotal =>
                    Permit <= '0';
                    ReturnChange <= '0';
                    if(Input = "000") then
                        NextState <= TenRCV;
                    elsif(Input = "001") then
                        NextState <= FifteenRCV;
                    elsif(Input = "010") then
                        NextState <= TwentyRCV;
                    elsif(Input = "100") then
                        NextState <= OverTwentyRCV;
                    elsif(Input = "111") then
                        NextState <= Cancel;
                    end if;
                when FifteenRCV =>
                    if(Input <= "111") then
                        NextState <= Cancel;
                    else
                        NextState <= FifteenTotal;
                    end if;
                when FifteenTotal =>
                    Permit <= '0';
                    ReturnChange <= '0';
                    if(Input = "000") then
                        NextState <= FifteenTotal;
                    elsif(Input = "001") then
                        NextState <= TwentyRCV;
                    elsif(Input = "010") then
                        NextState <= OverTwentyRCV;
                    elsif(Input = "100") then
                        NextState <= OverTwentyRCV;
                    elsif(Input = "111") then
                        NextState <= Cancel;
                    end if;
                when TwentyRCV =>
                    NextState <= TwentyTotal;                                 
                when TwentyTotal =>
                    Permit <= '1';
                    ReturnChange <= '0';
                    NextState <= Start;
                when OverTwentyRCV =>
                    NextState <= OverTwentyTotal;                             
                when OverTwentyTotal =>
                    Permit <= '1';
                    ReturnChange <= '1';
                    NextState <= Start;
                when Cancel =>
                    Permit <= '0';
                    ReturnChange <= '1';
                    NextState <= Start;
            end case;
        end process;
END Behavioral;
