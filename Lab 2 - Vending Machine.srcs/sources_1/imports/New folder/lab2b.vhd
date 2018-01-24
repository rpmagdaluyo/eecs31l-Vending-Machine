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

END Behavioral;