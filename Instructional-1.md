# Hello World!  (How to blink an LED)

In this instructional we will explore some of the very basics of VHDL and digital circuit design.  Just like when programming microcontrollers, we'll start by flashing an LED.  

## Step one:  The counter 

In order to time the LED, we need to build a timer.  To do this, we will count the number of clock cycles and after a certain number is reached, we will flash the LED.  This will act as our delay function.  The code for this module looks like this:  

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
	process(clk) begin
		if(rst = '0') then
			if(rising_edge(clk)) then
				counter <= temp + 1;
			end if;
		else
			counter <= "0000000000000000000";
		end if;
	end process;
	led <= counter(24);
end Behavioral;
```

##Breaking it down

Wow!  What's this?  Let's explore...  

The top four lines of course, are library definitions.  These are the standard definitions for most VHDL modules.  

```VHDL
entity Pulser is
    Port ( clk : in STD_LOGIC;
	   rst : in STD_LOGIC;
	   led : out STD_LOGIC);
end Pulser;
```

These lines comprise the module definition.  This is the equivalent of a function or method definition in most other programming languages.  In this definition, we have three signals: `clk`, `rst`, and `led`.  These are all of the type ```STD_LOGIC``` which defines a one bit logic signal.  ```clk``` and `rst` are inputs and `led` is an output.  

```
architecture Behavioral of Pulser is
	signal counter : STD_LOGIC_VECTOR(24 downto 0);
begin
	process(clk) begin
		if(rst = '0') then
			if(rising_edge(clk)) then
				counter <= temp + 1;
			end if;
		else
			counter <= "0000000000000000000";
		end if;
	end process;
	led <= counter(24);
end Behavioral;
```

This next part is the meat of the module.  It's where we set the logic that will use the inputs and define the outputs.  First, we declare a signal and call it ```counter```.  This signal is like the others we used as inputs and outputs, but it is of the type ```STD_LOGIC_VECTOR``` instead of ```STD_LOGIC```.  This just means that it is a multiple bit signal.  The parenthesis designate that it will be a 25 bit signal and the most significant bit, MSB, is in first, with the least significant bit, LSB, in the leftmost position.  

The process block means that everything inside is done in sequential order.  First we check if ```rst``` is high.  If it is, we reset the counter to 0.  As long as ```rst``` is low, we will increment the counter by one each time the clock signal goes high.  The counter will count all the way to 1111111111111111111111111 (33,554,431 or 2^25) and once it is incremented again, it will go back to zero since there isn't enough room to store the extra bit.  

The last thing we need to do is assign the `led`output the value of the 25th bit of the counter.  This will turn it on and off.  

Also, I should mention that parentheses around a number designate a vector.  Apostrophes around a number designate a standard logic type.  

### A Note About Timing

The timing of your LED will depend on the clock speed of your device.  As an example, the clock speed of my device is 50 mhz so it oscillates at 50,000,000 times a second.  That means that each clock cycle takes 1/50,000,000 of a second to complete.  1 / 50,000,000 * 33,554,431 = 0.671 So our led will blink every 0.671 seconds.  


