# Hello World!  (How to blink an LED)

In this instructional we will explore some of the very basics of VHDL and digital circuit design.  Just like when programming mircrocontrollers, we will do this by flashing an LED.  

<h2> Step one:  The counter </h2>

In order to time the LED, we need to build a timer.  To do this, we will count the number of clock cycles and after a certain number is reached, we will flash the LED.  This will act as our delay function.  The code for this module looks like this:  

<code>
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Pulser is
    Port ( clk : in STD_LOGIC;
			  rst : in STD_LOGIC;
           pulse : out STD_LOGIC);
end Pulser;

architecture Behavioral of Pulser is
	signal temp : STD_LOGIC_VECTOR(18 downto 0);
begin
	process(clk) begin
		if(rst = '0') then
			if(rising_edge(clk)) then
				temp <= temp + 1;
			end if;
		else
			temp <= "0000000000000000000";
		end if;
	end process;
	pulse <= temp(18);
end Behavioral;
</code>