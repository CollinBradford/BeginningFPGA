# Getting Started with FPGA's Featuring: Mojo Development Platform

## Introduction

Welcome!  I am a student working at Fermilab helping to develop a data acquisition system using FPGAs.  For purposes of documentation, I have been commissioned to write a set of instructionals and documentation pages explaining the project as I go along.  I hope a lot of people can use these tutorials to get started using FPGAs.  Most of this documentation will be about learning how to use FPGAs. I won't spend too much time explaining programming practices or digital design.  There are plenty of textbooks and tutorials out there for that.  I will, however, leave links to many great resources for learning HDL and digital design.  

This set of tutorials starts with the basics.  We will use the Mojo development platform as a springboard to get us started so we can use some really awesome and complicated tools later.  


## Getting Everything Together

For anyone just starting out learning FPGA and digital circuit design, I recommend the Mojo Development Board from Embedded Micro.  I consider it the "Arduino"  of FPGA's.  As far as FPGAs go, it's just about as plug-and-play as you can get.  The development board consists of a Spartan 6 paired with an Atmel microcontroller.  Each chip can be programmed, but as I understand it, the microcontroller acts as the JTag programmer, eliminating the need for an expensive programmer from Xilinx.  

For programming an FPGA using the Mojo environment, you will need the following things.  

1. FPGA development board
2. Mojo IDE
3. Mojo Loader.  Although not strictly necessary, we will use it to load files we develop in ISE.  
4. Xilinx ISE Design Suite

The FPGA can be purchased from the products page on the Mojo site.  

Instructions for how to download and install the Mojo IDE and Mojo Loader can be found in the 2nd and 3rd links in the resources section.  

The ISE design suite is a large collection of software from Xilinx.  (the company that develops the FPGA's we use)  Just follow the instructions from Embedded Micro on the page from the 4th link in the resources section.  

## Getting Started with the Software

Currently, the Mojo development environment only uses Verilogue and Lucid.  (A language from our friends at Embedded Micro) Since these tutorials will be primarily in VHDL, I will leave it up to you to explore Verilogue and Lucid.  If you need some education on the basics of digital design, I would highly recommend their tutorials on the Embedded Micro website.  They can be found from the 5th link in the resources section. 

## Tying things up

This has been kind of the intro to Mojo page.  In the next section I will actually have a basic project with code written in VHDL and some explanation.  


## Resources

1. Mojo home page: https://embeddedmicro.com/

2. Mojo IDE: https://embeddedmicro.com/tutorials/mojo-software-and-updates/mojo-ide

3. Mojo Loader: https://embeddedmicro.com/tutorials/mojo-software-and-updates/installing-mojo-loader 

4. ISE Design Suite: https://embeddedmicro.com/tutorials/mojo-software-and-updates/installing-ise

5. Mojo Tutorials:  https://embeddedmicro.com/tutorials 
