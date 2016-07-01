#Getting Started with FPGA's Featuring: Mojo Development Platform

##Intorduction

Welcome!  I am a student working at Fermilab helping to develop a data aquisition system using FPGA's.  For purposes of documentation, I have been commishioned to write a set of instructionals and documentation pages explaning the project as I go along.  I hope a lot of people can use these tutorials to get started using FPGA's.  Most of this documtation will be about learning how to use FPGA's. I won't spend to much time explaning programming practices or digital design.  There are plenty of textbooks and tutorials out ther for that.  I will, however, leave links to many great resources for learning HDL and digital design.  

This set of tutorials starts with the basics.  We will use the Mojo development platform as a springboard to get us started so we can use some really awesome and complicated tools later.  


##Getting Everything Together

First of all, we need the tools.  Check out the Mojo home page and get familiar with the platform we will be working with.  It is the first link in the resources below.  Mojo is a FPGA development platform from Embedded Micro.  I consider it the "Arduino"  of FPGA's.  It is really simple to use.  Just about as plug-and-play as you can get.  It is really a Spartian 6 combined with a Atmel microcontroller.  The microcontroller can be programmed and also acts as the "bridge" between the computer and the FPGA.  

For programming an FPGA, you need Four things:  

1. FPGA I am using Mojo V3
2. Mojo IDE
3. Mojo Loader.  Although not strictly nessary, we will use it to load files we develop in ISE.  
4. Xilinx ISE Design Suite

The FPGA can be purchased from the products page on the Mojo site.  

Instructions for how to downolad and install the Mojo IDE and Mojo Loader can be found in the 2nd and 3rd links in the resources section.  

The ISE deisng suite is a large collection of software from Xilinx.  (the company that develops the FPGA's we use)  Just follow the instructions from Embedded Micro on the page from the 4th link in the resouces section.  

##Getting Started with the Software

Currently, the Mojo development enviornment only uses Verilogue and Lucid.  (A launguage from our friends at Embedded Micro) Since these tutorials will be primarily in VHDL, I will leave it up to you to explore Verilogue and Luid.  If you need some education on the basics of digital design, I would highly recommend their tutorials.  They can be found from the 5th link in the resources section. 

## Tying things up

This has been kind of the intro to Mojo page.  In the next section I will actually have a basic project with code written in VHDL and some explination.  


##Resources

1. Mojo home page: https://embeddedmicro.com/

2. Mojo IDE: https://embeddedmicro.com/tutorials/mojo-software-and-updates/mojo-ide

3. Mojo Loader: https://embeddedmicro.com/tutorials/mojo-software-and-updates/installing-mojo-loader 

4. ISE Design Suite: https://embeddedmicro.com/tutorials/mojo-software-and-updates/installing-ise

5. Mojo Tutorials:  https://embeddedmicro.com/tutorials 
