#Getting Started With OtS Ethernet Interface

In this tutorial we will begin learning how to interface with our FPGA through the OtS Ethernet Interface.  

##Setting Everything Up  

To start out, we need to power up the board and ping it.  The powering part is pretty basic.  3.3v to the power conenctor near the JTag connecter.  Keep in mind that the basic project runs at around 3 amps so not any simple power supply will work.  Once it is powered, hit the reset button.  The lights on the physical ethernet chip should light up.  This will tell you that the board is powered properly and turned on.  

## Connecting to the Board

The default IP address for the ethernet module is 192.168.133.2 .  To connect to the board, we need to verify that we have the right settings for our computer.  To check these, go to: Network and Sharing Center => [network with captan] => properties => select IPv4 => properties.  The IP address in the IP address field should be something like: 192.168.133.199 . You can choose the last number just as long as it isn't 2.  The subnet mask should be set to 255.255.255.0 . Once everythgin is right, click OK.  

## Ping Test

Now we sill try to connect to the captan board to verify that everythign is working well.  

First, open Wireshark and start monitoring the connection with your captan board.  This will let us see everything being sent and received to the board.  Next, open the command line and type `ping 192.168.133.2` .  If you get a response, the board is working and you can connect to it. Go ahead and look at Wireshark.  You can see the ping requests and the responses from the captan board.

##Setting Registers

Now that we can connect to the captan board, we will try to set a register.  To do this, we will use the controll software for Windows.  Download the zip file with the software and unzip it.  It's the first resource at the bottom of the page.  

Once you have the software, start the global_master application.  From the CAPTAN_SOFTWARE file, just follow the Captan_Global_Master directories until you find the application.  Next, start the captan controller.  This application can be found just like the first by following the CAPTAN_Controller folders.  Once this is open, put your IP address in the Global Master IP text field and click GM Connect.  On the right side of the window, put 2 in the captan address field and click captan connect.  you should get a message that starts with `Captan Receive work loop started...` .  The last piece of software is the captan GUI.  Once you start the application, put your IP address in the Global Master IP field and click connect as master.  Select the captan board from the list just under the refresh button.  Wow, that was a long setup process.  

### Resources

This is where I will put all the resources linked withth this tutorial.  

1. Windows Software: http://www-ese.fnal.gov/dig_test_stand/tmp/captan_software_1_8_1.zip
2. OtS Ethernet Interface User's Guide:  https://docs.google.com/document/d/1i3Z07n8Jq78NwgUFdjAv2sLGhH4rWjHeYEScAWBzSyw/edit
3. OtS Interface Address Space:  http://otsdaq.fnal.gov/docs/oei_address_space.html
