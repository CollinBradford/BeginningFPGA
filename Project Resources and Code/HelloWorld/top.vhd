----------------------------------------------------------------------------------
-- Company: Fermilab
-- Engineer: Collin Bradford
-- 
-- Create Date:    13:10:25 04/27/2016 
-- Design Name: 
-- Module Name:    top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.All;
use ieee.std_logic_unsigned.all;

entity top is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           led : out  STD_LOGIC);
end top;

architecture Behavioral of top is
	signal counter : std_logic_vector(24 downto 0);
begin
	
	process(clk, rst) begin
		if(rst = '1') then
			if(rising_edge(clk)) then
				counter <= counter + 1;
			end if;
		else
			counter <= "0000000000000000000000000";
		end if;
	end process;
	
	led <= counter(24);
	
end Behavioral;

