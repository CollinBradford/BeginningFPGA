# Hello World!  (How to blink an LED)

In this instructional we will explore some of the very basics of VHDL and digital circuit design.  Just like when programming microcontrollers, we'll start by flashing an LED.  

## The Code:

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

The top four lines of course, are library definitions.  These are some of the standard definitions for most VHDL modules.  

```VHDL
entity Pulser is
    Port ( clk : in STD_LOGIC;
	   rst : in STD_LOGIC;
	   led : out STD_LOGIC);
end Pulser;
```

These lines comprise the module definition.  This is the equivalent of a function or method definition in most other programming languages.  In this definition, we have three signals: `clk`, `rst`, and `led`.  These are all of the type `STD_LOGIC` which defines a one bit logic signal.  `clk` and `rst` are inputs and `led` is an output.  

```VHDL
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

This next part is the meat of the module.  It's where we set the logic that will use the inputs and define the outputs.  Making an led blink is simple, but making it blink with a visible delay is a little harder.  To delay the led, we will count clock cycles up until a certain point and then invert the state of the led.  

First, we declare a signal and call it `counter`.  This signal is like the others we used as inputs and outputs, but it is of the type `STD_LOGIC_VECTOR` instead of `STD_LOGIC`.  This just means that it is a multiple bit signal.  The parenthesis designate that it will be a 25 bit signal and the most significant bit, MSB, is in first, with the least significant bit, LSB, in the leftmost position.  

The process block means that everything inside is done in sequential order.  First we check if `rst` is high.  If it is, we reset the counter to 0.  As long as `rst` is low, we will increment the counter by one each time the clock signal goes high.  The counter will count all the way to 1111111111111111111111111 (33,554,431 or 2^25) and once it is incremented again, it will go back to zero since there isn't enough room to store the extra bit.  

The last thing we need to do is assign the `led`output the value of the 25th bit of the counter.  This will turn it on and off.  

Also, I should mention that parentheses around a number designate vectors.  Apostrophes around a number designate a standard one bit logic type.  

### A Note About Timing

The timing of your LED will depend on the clock speed of your device.  As an example, the clock speed of my device is 50 mhz so it oscillates at 50,000,000 times a second.  That means that each clock cycle takes 1/50,000,000 of a second to complete.  1 / 50,000,000 * 33,554,431 = 0.671 So our led will blink every 0.671 seconds with a 50% duty cycle.  The design we used was fairly simple.  In a future tutorial, we will build a PWM module that will allow us to change the duty cycle.  

#Constraints

This section is about mapping all those input and output signals from the Hello World design to actual pins on your device.  This actually isn't that hard.  It involves using a constraints file with the extension .ucf 

The following code works for the Hello World application on the Mojo Spartan 6 development board.  

```VHDL
NET "CLK" LOC = P56 | IOSTANDARD = LVTTL;
NET "RST" LOC = P38 | IOSTANDARD = LVTTL;
NET "LED" LOC = P134 | IOSTANDARD = LVTTL;
```

In the code, we declare a `NET` with the name in quotation marks and assign it a pin number.  The `IOSTANDARD` part assigns an IO standard to the pin.  This defines the voltages at which the pin inherits different states.  Take a look at the graphic here: http://m.eet.com/media/1103154/Fig1.gif  It shows the voltage levels for different standards.  We are using 3.3v LVTTL.  
