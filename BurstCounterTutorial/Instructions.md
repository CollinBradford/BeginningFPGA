#Getting Started With OtS Ethernet Interface

In this tutorial we will begin learning how to interface with our FPGA through the OtS Ethernet Interface.  

##Setting Everything Up  

To start out, we need to power up the board and ping it.  The powering part is pretty basic.  3.3v to the power conenctor near the JTag connecter.  Keep in mind that the basic project runs at around 3 amps so not any simple power supply will work.  Once it is powered, hit the reset button.  The lights on the physical ethernet chip should light up.  This will tell you that the board is powered properly and turned on.  

## Connecting to the Board

The default IP address for the ethernet module is 192.168.133.2 .  To connect to the board, we need to verify that we have the right settings for our computer.  To check these, go to: Network and Sharing Center => [network with captan] => properties => select IPv4 => properties.  The IP address in the IP address field should be something like: 192.168.133.199 . You can choose the last number just as long as it isn't 2.  The subnet mask should be set to 255.255.255.0 . Once everythgin is right, click OK.  

## Ping Test

Now we will try to connect to the captan board to verify that everythign is working well.  

First, open Wireshark and start monitoring the connection with your captan board.  This will let us see everything being sent and received to the board.  Next, open the command line and type `ping 192.168.133.2` .  If you get a response, the board is working and you can connect to it. Go ahead and look at Wireshark.  You can see the ping requests and the responses from the captan board.

##Setting up the Control Software

Now that we can connect to the captan board, we need to set up the control software which makes it easier to control the captan board.  The windows software can be downloaded from the firs resource link below.  

The software comes in three parts: captan master, captan controller, and captan gui.  This makes it easy to controll multiple captan boards on multiple conputers all on the same network.  They each need to be started in order with different settings.  I will walk you through them here.  

#### Captan Master

1. Launch the application. (captan_software_1_8_1\CAPTAN_SOFTWARE_\CAPTAN_Global_Master\CAPTAN_Global_Master) 

#### Captan Controller

1. Launch application. (captan_software_1_8_1\CAPTAN_SOFTWARE_\CAPTAN_Controller\CAPTAN_Subnet_Master)
2. In the Global Master IP field put the IP address of your computer (or of the computer running the global master software.  For the purpose of this tutorial, this should be your computer.  )
3. Click GM Connect to connect to the global master.  
4. In the CAPTAN Address field put the last byte of the IP address of your board.  The default for your board is 2.  
5. Click CAPTAN Connect to connecto the captan board.  
6. Verification:  
    1. GM Communicaiton Thread Status should contain the line: GM Connection Established.  
    2. Captan Receive Thread Status  should contain the line: Captan Read Socket Initalized.  
  
If the connections return errors, double check the addresses and make sure that the global master software is runninng.  If it cannot connect with the captan board, try pinging it to make sure everythign is working.  If that doesn't work, reset the board using the onbaord reset button located just to the outside of the J3 connector.  

#### Captan GUI

1. Laungh application.  (captan_software_1_8_1\CAPTAN_SOFTWARE_\CAPTAN_Gui\CAPTAN_Gui)
2. In the Global Master IP field, put the IP address of your computer (or whatever computer the global master software is running on).
3. Click Connect as Master.  This gives you conrol over the captan board.  Clicking Connecto to Chat will let you see what is going on and communicate with other operators using the gui on other computers but you won't be able to send commands to the captan board.
4. Select the captan board from the list.  The name of the board can be found from the captan controller software by looking at the text field labeld "CAPTAN Controller Alias".
5. You should see a line on the console in the bottom left corner that says "Connected as Master".  

#### Setting Registers

Alright, we have all that setup done.  Let's set some registers.  Go to the web address for the address space. It's the third resource at the bottom of the page.  This defines the address space in the ethernet module and says what each register does.  Now, open wireshark so we can see what's going on behind the scenes.  Once everything is setup, we are going to read from the version register.  On the address space page, it's the second to last one with the fild name "ETH_INTERFACE_VERSION".  We see that it is in block one at address 64.  To read from this register, go to the captan gui application.  On the right side of the page in the Basic Commands tab under CAPTAN Controls there is a an address field.  Type in the block number and the address so it says "0000000100000064".  Click Read.  In the consol window it should say the data that was read from the captan board.  Open wireshark and look at the recent trnansmissions.  There should be two UDP packages in addition to all the other stuff.  One should be from your computer to the captan board, the other from the captan board to the computer.  If you open these and look at the data, you will see what was transmitted to the board and what it sent back.  

Now, we are going to set the burst_mode register and read it back.  Change the address to reflect this register "0000000100000064" and put 1 in the data field.  Write the value and then read it back.  In the console you should receive a one back.  Change the one back to a zero and repeat the process and the register should change back to a zero.  

### Resources

1. Windows Software: http://www-ese.fnal.gov/dig_test_stand/tmp/captan_software_1_8_1.zip
2. OtS Ethernet Interface User's Guide:  https://docs.google.com/document/d/1i3Z07n8Jq78NwgUFdjAv2sLGhH4rWjHeYEScAWBzSyw/edit
3. OtS Interface Address Space:  http://otsdaq.fnal.gov/docs/oei_address_space.html
