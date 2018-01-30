--------------------------------------------------------------------------------
-- Company:       UCI EECS 31L
-- Engineer:      QV
--
-- Create Date:   14:25:53 1/22/2018
-- Design Name:   
-- Module Name:   D:/Xilinx/f13/lab2_permit/lab2b_tb.vhd
-- Project Name:  lab2_permit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Lab2b_FSM
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
 
ENTITY lab2b_tb IS
END lab2b_tb;
 
ARCHITECTURE behavior OF lab2b_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Lab2b_FSM
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
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Lab2b_FSM PORT MAP (
          Input => Input,
          Clk => Clk,
          Permit => Permit,
          ReturnChange => ReturnChange
        );

   -- Clock process definitions
   Clk_process: process
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

      -- insert stimulus here 

        -- ignoring any setup/hold time issues for behavior --
		-- TEST CASE 0 BEGIN (provided) --
		
		-- insert Ten (Ten total)
		Input <= "010";
		Wait for 20 NS ;
		
	    Input <= "000";
		Wait for 20 NS ;
		
		-- insert Five (Twenty total)
	    Input <= "001";
		Wait for 20 NS ;
		
	    Input <= "000";
		Wait for 20 NS ;
		
		-- insert Five ($20 total, expecting P=1, R=0)
	    Input <= "001";
		Wait for 10 NS ;
		ASSERT Permit = '1' REPORT "p = 1 fail with test case 0" SEVERITY WARNING;
		ASSERT ReturnChange = '0' REPORT "r = 0 fail with test case 0" SEVERITY WARNING;
		Wait for 10 NS ;
		
        -- more test cases here
        
		-- insert Twenty 
		Input <= "100";
		wait for 10ns;
		assert Permit = '1' report "p = 1 fail with test case 1" severity warning;
		assert ReturnChange = '0' report "r = 0 fail with test case 1" severity warning;
		wait for 10ns;
		
		-- insert NoBill after getting the permit;
		Input <= "000";
		wait for 10ns;
		assert Permit = '1' report "p = 1 fail with test case 2" severity warning;
        assert ReturnChange = '0' report "r = 0 fail with test case 2" severity warning;
        wait for 10ns;
		
		-- insert Five;
		Input <= "001";
		wait for 10ns;
		assert Permit = '0' report "p = 0 fail with test case 3" severity warning;
        assert ReturnChange = '0' report "r = 0 fail with test case 3" severity warning;
        wait for 10ns;
		
		-- insert Ten;
		Input <= "010";
		wait for 10ns;
		assert Permit = '0' report "p = 0 fail with test case 4" severity warning;
        assert ReturnChange = '0' report "r = 0 fail with test case 4" severity warning;
        wait for 10ns;
		
		-- insert Twenty;
		Input <= "100";
		wait for 10ns;
		assert Permit = '1' report "p = 1 fail with test case 5" severity warning;
        assert ReturnChange = '1' report "r = 1 fail with test case 5" severity warning;
        wait for 10ns;

                
        -- insert NoBill after getting the permit;
        Input <= "000";
        wait for 10ns;
        assert Permit = '0' report "p = 0 fail with test case 6" severity warning;
        assert ReturnChange = '0' report "r = 0 fail with test case 6" severity warning;
        wait for 10ns;
                
      wait;
   end process;

END;
