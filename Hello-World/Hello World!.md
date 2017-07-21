# Hello World!  (How to blink an LED)

This instructional is designed to be an aid in programming the Mojo board using VHDL.  We won't really dive into the VHDL code.    

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


### Creating a new project

The first thing to do is create the project.  From the toolbar go to File => new project.  This will open up the new project wizard.  It will guide you through creating a project.  Because this is digital circuit design, the project wizard needs to know what FPGA you are using as well as some other details about the project.  Most of the FPGA identification information can be found stamped on the back of the chip.  For a basic project using the Mojo development board, your project setting page should look like this:  

![alt text](https://github.com/CollinBradford/BeginningFPGA/blob/master/Hello-World/Project%20Resources/Project%20Settings.PNG "Project Properties")

## Compiling

To compile all the source code and load it onto the Mojo FPGA, we need to edit the compiling properties.  From the Design tab, click on the top file.  In the window just below the hierarchy, right click Generate Programming File and select Process Properties.  Under General Options, select Create Binary Configuration File.  This will tell the compiler to create a .bin file that we can use with the Mojo Loader.  After you are done with the process properties, double click Generate Programming File.  It should generate the file without errors.  

To load the file, open the Mojo Loader and click Open Bin File.  The generated bin file should be in the same folder as your ISE project.  Once you have the bin file open in the loader, simply click load.  The option to flash the chip is basically selecting whether or not you want to program the flash memory.  Programming the flash memory means that the design stays on the board after it is powered off.  If you don't program the flash, it will run on the board until the power is removed. 

#Resources

Here are the resources for learning VHDL and digital design.  Remember:  There is a difference between VHDL and digital design.  Digital design is using logic components to do what you want.  VHDL is just a language to tell the computer how to use those logic gates.  Both must be learned to gain a good understanding of FPGA design.  

1. Quick start guide for ISE Design Suite: http://www.xilinx.com/itp/xilinx10/books/docs/qst/qst.pdf

2. Embedded Miro Tutorials:  https://embeddedmicro.com/tutorials

3. FREE VHDL WEB BOOK!  (just put in your email address and download the open source book) http://freerangefactory.org/

4. VHDL Primer: http://www.seas.upenn.edu/~ese171/vhdl/vhdl_primer.html

5. Introduction to Logic Gates (At the bottom of the page you can move to the next tutorials that talk about each individual logic gate): http://www.electronics-tutorials.ws/logic/logic_1.html
