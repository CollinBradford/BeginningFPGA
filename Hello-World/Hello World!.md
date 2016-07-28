# Hello World!  (How to blink an LED)

This instructional is going to help get you started using ISE Design suite and VHDL to program your Mojo board.  By design, the Mojo development environment does not come with support for VHDL.  It only supports Verilogue and their programming language, Lucid.  However, the mojo loader can take any bin file you throw at it, so all you have to do is set up ISE to program a bin file and you can flash that on to the Mojo board.  It is not half as hard as it sounds.    

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
NET "clk" TNM_NET = clk;
TIMESPEC TS_clk = PERIOD "clk" 50 MHz HIGH 50%;

NET "clk" LOC = P56 | IOSTANDARD = LVTTL;
NET "rst" LOC = P38 | IOSTANDARD = LVTTL;
NET "led" LOC = P134 | IOSTANDARD = LVTTL;
```

### Breaking it down.  

Wow, what's this?  I won't go into too much detail, but here are the basics:  The first few lines of code include the different libraries we will be using.  The next few lines define the entity.  This is the equivalent to a function definition.  It shows all the input signals and output signals.  The behavior block defines what we do with those signals.  Lastly, the constraints at the very end are in a different file.  They map some of the ports to actual pins on the device.  

## Using ISE

To learn ISE, I would recommend running through the tutorial and setting up the project yourself instead of just downloading the project files.  This is always beneficial the first time.  

### Creating a new project

First thing to do is create the project.  From the toolbar go to File => new project.  This will open up the new project wizard.  It will guide you through creating a project.  Assuming you have used and IDE before, you probably are already familiar with the wizard, but for this project, we need to give a little more information.  You will need to select the FPGA you are using, the simulator, and the language.  All the FPGA information should be stamped on the FPAG.  Unless you have paid for a better simulator, we will be using ISim.  The language will be VHDL.  In the future, we will use a schematic for our top language.  The individual components will be written in VHDL, but we will connect everything together with the schematic.  Your project setting page should look like this:  

![alt text](https://github.com/CollinBradford/BeginningFPGA/blob/master/Hello-World/Project%20Resources/Ports.PNG "Projet Properties")

### Adding a VHDL Module

After finishing with the project wizard you should have a new project!  Yay!  Now we need to add the files.  In the Design tab on the left side of the screen, right click on the chip number and select New Source.  Now, create a new VHDL module and call it something like “top”.  Next is where you define the ports you are going to use.  This is very helpful as it reduces the amount of coding you have to do later, by adding ports for you.  We are going to add three ports to this module: clk, rst, and pulse.  clk and rst will be inputs, and pulse will be an output.  In the end it should look like this:  

![alt text](https://github.com/CollinBradford/BeginningFPGA/blob/master/Hello-World/Project%20Resources/Project%20Settings.PNG "Ports")

Once you have finished creating your project, it you should see your ports automatically added at the top.  You can edit them if needed, but adding them first will give us a good starting point.  All you need to do now, is add the code that's pictured above and you should be good to go!  

### Adding Constraints

As I mentioned above, constraints go in a different file.  They tell the FPGA what pins to use for what signals.  The process for creating a constraints file is pretty much the same as last time.  Just select constraints (UCF) file instead of VHDL.  Once it is created, copy the above constraints code.  

## Compiling

Ah, here's where we get to the fun part.  To compile all the source code and load it onto the Mojo FPGA, we need to edit the compiling properties.  From the Design tab, click on the top file.  In the window just below the Hierarchy, right click Generate Programming File and select Process Properties.  Under General Options, select Create Binary Configuration File.  This will tell the compiler to create a .bin file that we can use with the Mojo Loader.  After you are done with the process properties, double click Generate Programming File.  It should generate the file without errors.  

To load the file, open the Mojo Loader and click Open Bin File.  The generated bin file should be in the same folder as your ISE project.  Once you have the bin file open in the loader, simply click load.  The option to flash the chip is basically selecting whether or not you want to program the flash memory.  Programming the flash memory means that the design stays on the board after it is powered off.  If you don't program the flash, it will run on the board until the power is removed.  

Congratulations!  You have now created a project and loaded onto your FPGA!  One of the LED's should be flashing on and off.  Remember to check out the resources section for tutorials on VHDL and more on the ISE Design Suite.  I would highly recommend checking out the tutorials on the embedded micro site.  Even though they aren't written in VHDL, they are valuable for getting to know digital design.

#Resources

Here are the resources for learning VHDL and digital design.  Remember:  There is a difference between VHDL and digital design.  Digital design is using logic components to do what you want.  VHDL is just a language to tell the computer how to use those logic gates.  Both must be learned to gain a good understanding of FPGA design.  

1. Quick start guide for ISE Design Suite: http://www.xilinx.com/itp/xilinx10/books/docs/qst/qst.pdf

2. Embedded Miro Tutorials:  https://embeddedmicro.com/tutorials

3. FREE VHDL WEB BOOK!  (just put in your email address and download the open source book) http://freerangefactory.org/

4. VHDL Primer: http://www.seas.upenn.edu/~ese171/vhdl/vhdl_primer.html

5. Introduction to Logic Gates (At the bottom of the page you can move to the next tutorails that talk about each indivisual logic gate): http://www.electronics-tutorials.ws/logic/logic_1.html

