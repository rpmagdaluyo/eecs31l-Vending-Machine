--------------------------------------------------------------------------------
-- Company:       UCI EECS 31L
-- Engineer:      QV
--
-- Create Date:   15:03:20 1/22/2018
-- Design Name:   
-- Module Name:   D:/Xilinx/f13/lab2_permit/lab2s_tb.vhd
-- Project Name:  lab2_permit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Lab2s_FSM
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY lab2s_tb IS
END lab2s_tb;
 
ARCHITECTURE behavior OF lab2s_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Lab2s_FSM
    PORT(
         Input : IN  std_logic_vector(2 downto 0);
         Clk : IN  std_logic;
         Permit : OUT  std_logic;
         ReturnChange : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Input : std_logic_vector(2 downto 0) := (others => '0');
   signal Clk : std_logic := '0';

 	--Outputs
   signal Permit : std_logic;
   signal ReturnChange : std_logic;

   -- Clock period definitions 
   -- MAKE SURE TO UPDATE FOR STRUCTURAL
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Lab2s_FSM PORT MAP (
          Input => Input,
          Clk => Clk,
          Permit => Permit,
          ReturnChange => ReturnChange
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      
      
        -- waiting for next clock edge, then adding a little bit of time
        -- avoiding any potential setup/hold time errors
        -- you can remove these next 2 lines and/or modify them as you wish
        WAIT UNTIL clk = '1' AND clk'EVENT;
		wait for 2 ns;

      -- insert stimulus here 
		
		-- TEST CASE 0 BEGIN --
		
      wait;
   end process;

END;
