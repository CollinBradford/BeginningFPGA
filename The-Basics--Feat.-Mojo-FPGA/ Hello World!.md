# Hello World!  (How to blink an LED)

In this instructional we will explore some of the very basics of VHDL and digital circuit design.  Just like when programming microcontrollers, we'll start by flashing an LED.  

## The Code:

This is just to give you a basic idea of the code.  The full ISE project can be downloaded from the repository.  

```VHDL
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Pulser is
    Port ( clk : in STD_LOGIC;
	   rst : in STD_LOGIC;
	   led : out STD_LOGIC);
end Pulser;

architecture Behavioral of Pulser is
	signal counter : STD_LOGIC_VECTOR(24 downto 0);
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
```

```VHDL
NET "clk" LOC = P56;
NET "rst" LOC = P38 | IOSTANDARD = LVTTL;
NET "led" LOC = P134 | IOSTANDARD = LVTTL;
```

##Breaking it down.  

Wow, what's this?  I won't go into too much detail, but here are the basics:  The first few lines of code include the different libraries we will be using.  The next few lines define the entity.  This is the equivelant to a function definition.  It shows all the input signals and output signals.  The behavior block defines what we do with those signals.  
