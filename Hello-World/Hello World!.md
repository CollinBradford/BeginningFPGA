# Hello World!  (How to blink an LED)

This instructional is going to help get you started using ISE Design suite and VHDL to program your Mojo board.  By design, the Mojo development enviornment does not come with support for VHDL.  It only supports Verilogue and their programming language, Lucid.  However, the mojo loader can take any bin file you throw at it, so all you have to do is set up ISE to program a bin file and you can flash that on to the Mojo board.  It is not half as hard as it sounds.    

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

Wow, what's this?  I won't go into too much detail, but here are the basics:  The first few lines of code include the different libraries we will be using.  The next few lines define the entity.  This is the equivelant to a function definition.  It shows all the input signals and output signals.  The behavior block defines what we do with those signals.  Lastly, the constraints at the very end are in a different file.  They map some of the ports to actual pins on the device.  

##Using ISE

To learn ISE, I would recommend running throught the tutorial and setting up the project yourself instead of just downloading the peoject files.  This is always benificial the first time.  

###Creating a new project

First thing to do is create the project.  From the toolbar go to File => new project.  This will open up the new project wizard.  It will guide you through creating a project.  Assuming you have used and IDE before, you probably are alread familiar with the wizard, but for this project, we need to give a little more information.  You will need to select the FPGA you are using, the simulator, and the language.  All the FPGA information should be stamped on the FPAG.  Unless you have paid for a better simulator, we will be using ISim.  The language will be VHDL.  In the future, we will use a schematic for our top language.  The indivisual components will be written in VHDL, but we will connect everything together with the schematic.  Your project setting page should look like this:  



#Resources

1. http://www.xilinx.com/itp/xilinx10/books/docs/qst/qst.pdf
